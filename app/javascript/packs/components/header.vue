<template>
  <div>
    <ul id="dropdown" class="dropdown-content">
      <li><router-link to="/">Top<i class="material-icons left">home</i></router-link></li>
      <li><router-link to="/books">Books<i class="material-icons left">library_books</i></router-link></li>
      <li><router-link to="/users">Users<i class="material-icons left">people</i></router-link></li>
    </ul>
    <nav>
      <div class="nav-wrapper">
        <div class="brand-logo right">
          <router-link to="/">Rutsubo<span style="font-size: 20px"> - Community Web Library -</span></router-link>
        </div>
        <ul class="left hide-on-med-and-down">
          <li><router-link to="/">Top<i class="material-icons left">home</i></router-link></li>
          <li><router-link to="/books">Books<i class="material-icons left">library_books</i></router-link></li>
          <!-- <li><router-link to="/books/request">Request<i class="material-icons left">live_help</i></router-link></li>
          <li><router-link to="/books/new">Register<i class="material-icons left">library_add</i></router-link></li> -->
          <li><router-link to="/users">Users<i class="material-icons left">people</i></router-link></li>
        </ul>
        <ul class="left hide-on-large-only">
          <li>
            <a class="dropdown-button" href="#!" data-activates="dropdown">
              Menu<i class="material-icons left">arrow_drop_down</i>
            </a>
          </li>
        </ul>
      </div>
    </nav>
  </div>
</template>

<style>
  .brand-logo {
    margin-right: 10px
  }
  i.left {
    margin-right: 10px;
}
</style>