import { application } from "./application"

import DashboardController from "./dashboard_controller"
application.register("dashboard", DashboardController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import ModalController from "./modal_controller"
application.register("modal", ModalController)
