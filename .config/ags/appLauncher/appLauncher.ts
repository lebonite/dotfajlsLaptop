import { App } from "astal/gtk3"
import style from "./Applauncher.scss"
import Applauncher from "/home/Hed/.config/ags/widget/Applauncher"

App.start({
    instanceName: "launcher",
    css: style,
    main: Applauncher,
})
