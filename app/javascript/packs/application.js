// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
import "comrade-styles";
import "../styles/index.scss";

Rails.start();
Turbolinks.start();
ActiveStorage.start();

document.addEventListener("turbolinks:load", () => {
  /** Flash alerts */

  setTimeout(() => {
    const alerts = document.querySelectorAll(".flash-alert");

    alerts.forEach((a) => a.classList.remove("show"));
  }, 3000);

  /** */

  /** Sidebar actions */

  const sidebar = document.querySelector(".sidebar");
  const content = document.querySelector(".page");
  const sidebarAnchorOpen = document.querySelector(".sidebar-anchor button");
  const sidebarAnchorClose = document.querySelector(".sidebar-header button");

  sidebarAnchorOpen.addEventListener("click", () => {
    sidebar.classList.add("open");
    sidebarAnchorOpen.disabled = true;

    if (window.innerWidth > 767) {
      content.classList.add("open");
    }
  });

  sidebarAnchorClose.addEventListener("click", () => {
    sidebar.classList.remove("open");
    sidebarAnchorOpen.disabled = false;
    content.classList.remove("open");
  });

  /** */
});
