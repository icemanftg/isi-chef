package ro.isi.restaurant

import grails.converters.JSON
import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException
import ro.isi.auth.Roles
import ro.isi.auth.UserService

import javax.servlet.http.HttpServletResponse

/**
 * ComandaController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Secured(['IS_AUTHENTICATED_FULLY'])
class ComandaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    ComandaService comandaService
    UserService userService

    def index() {

        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)

        def drinks = params.drinks == "true" ? true : false
        def list = !drinks ? Comanda.list(params) : Comanda.findAll(params, { drinksServerd == false })
        def comandaInstanceTotal = !drinks ? Comanda.count() : 10
        [comandaInstanceList: list, comandaInstanceTotal: comandaInstanceTotal, drinks: drinks]
    }

    @Secured([Roles.WAITER])
    def create() {
        def comanda = new Comanda(params)
        comanda.waiter = userService.getAuthenticatedWaiter()

        [comandaInstance: comanda, waiters: userService.getWaiters()]
    }

    @Secured([Roles.WAITER])
    def save() {
        def comandaInstance = new Comanda(params)
        comandaInstance.status = ComandaStatus.TAKEN;

        if (!comandaService.save(comandaInstance)) {
            comandaService.decrementStoks(comandaInstance)
            render(view: "create", model: [comandaInstance: comandaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'comanda.label', default: 'Comanda'), comandaInstance.id])
        redirect(action: "show", id: comandaInstance.id)
    }

    def show() {
        def comandaInstance = Comanda.get(params.id)
        if (!comandaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'comanda.label', default: 'Comanda'), params.id])
            redirect(action: "list")
            return
        }

        [comandaInstance: comandaInstance]
    }

    @Secured([Roles.WAITER])
    def nota() {
        def comandaInstance = Comanda.get(params.id)

        if (!comandaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'comanda.label', default: 'Comanda'), params.id])
            redirect(action: "list")
            return
        }

        def produsesQuantityMap = comandaService.productQuantities(comandaInstance)

        [comandaInstance: comandaInstance, produsesQuantityMap: produsesQuantityMap]
    }

    @Secured([Roles.WAITER])
    def notaPdf() {
        def comandaInstance = Comanda.get(params.id)

        if (!comandaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'comanda.label', default: 'Comanda'), params.id])
            redirect(action: "list")
            return
        }

        def produsesQuantityMap = comandaService.productQuantities(comandaInstance)
        def name = "Nota " + comandaInstance.id + " " + (new Date()).format("dd-MM-yyyy / HH:mm")
        renderPdf(template: "/comanda/nota",
                model: [comandaInstance: comandaInstance, produsesQuantityMap: produsesQuantityMap],
                filename: name + "pdf")
    }

    @Secured([Roles.WAITER])
    def edit() {
        def comandaInstance = Comanda.get(params.id)
        if (!comandaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'comanda.label', default: 'Comanda'), params.id])
            redirect(action: "list")
            return
        }

        [comandaInstance: comandaInstance, waiters: userService.getWaiters()]
    }

    @Secured([Roles.WAITER])
    def update() {
        def comandaInstance = Comanda.get(params.id)
        if (!comandaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'comanda.label', default: 'Comanda'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (comandaInstance.version > version) {
                comandaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'comanda.label', default: 'Comanda')] as Object[],
                        "Another user has updated this Comanda while you were editing")
                render(view: "edit", model: [comandaInstance: comandaInstance])
                return
            }
        }

        comandaInstance.properties = params

        if (!comandaService.save(comandaInstance)) {
            render(view: "edit", model: [comandaInstance: comandaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'comanda.label', default: 'Comanda'), comandaInstance.id])
        redirect(action: "show", id: comandaInstance.id)
    }

    @Secured([Roles.ADMINISTRATOR])
    def delete() {
        def comandaInstance = Comanda.get(params.id)
        if (!comandaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'comanda.label', default: 'Comanda'), params.id])
            redirect(action: "list")
            return
        }

        try {
            comandaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'comanda.label', default: 'Comanda'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'comanda.label', default: 'Comanda'), params.id])
            redirect(action: "show", id: params.id)
        }
    }

    @Secured([Roles.COOK])
    def listTakenOrders() {
        [comandaInstance: comandaService.getOrderAssignedToCurrentCook()]
    }

    @Secured([Roles.WAITER])
    def listPreparedOrders() {

    }

    @Secured([Roles.COOK])
    def takenOrdersCount = {
        def takenOrders = comandaService.getTakenOrdersCount();

        response.setStatus HttpServletResponse.SC_OK
        render takenOrders
    }
    @Secured([Roles.WAITER])
    def preparedOrdersCount = {
        def preparedOrders = comandaService.getPreparedOrdersCount();

        response.setStatus HttpServletResponse.SC_OK
        render preparedOrders
    }
    @Secured([Roles.WAITER])
    def unservedDrinksCount = {
        def preparedOrders = comandaService.getUnservedDrinksCount();

        response.setStatus HttpServletResponse.SC_OK
        render preparedOrders
    }

    @Secured([Roles.COOK])
    def listTakenOrdersAsJson() {
        response.setStatus HttpServletResponse.SC_OK
        response.setContentType "application/json"

        render comandaService.getTakenOrders() as JSON
    }

    @Secured([Roles.COOK])
    def assignOrder() {

        def alreadyAssignedCommand = comandaService.assignOrder params.orderId
        if (alreadyAssignedCommand)
            flash.message = message(code: 'order.exists.message', args: [message(code: 'comanda.label', default: 'Comanda')])
        redirect action: 'listTakenOrders', params: params
    }

    @Secured([Roles.COOK])
    def markAsPrepared() {
        comandaService.markAsPrepared params.id

        flash.message = message(code: 'order.prepared.message', default: "CONTACT ADMINISTRATOR")
        redirect action: "listTakenOrders"
    }

    @Secured([Roles.WAITER])
    def listPreparedOrdersAsJson() {
        response.setStatus HttpServletResponse.SC_OK
        response.setContentType "application/json"

        render comandaService.getPreparedOrders() as JSON
    }

    @Secured([Roles.WAITER])
    def deliver() {

        def delivered = comandaService.deliverOrder params.orderId
        if (delivered)
            flash.message = message(code: 'order.delivered.message', args: [params.orderId])
        else
            flash.message = message(code: 'order.not.delivered.message', args: [params.orderId])
        redirect action: 'listPreparedOrders', params: params
    }

    @Secured([Roles.WAITER])
    def deliverDrink() {
        def delivered = comandaService.deliverDrink params.orderId

        redirect action: 'list', params: params
    }
}
