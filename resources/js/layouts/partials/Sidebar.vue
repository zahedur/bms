<template>
    <div id="sidebar" class="active">
        <div class="sidebar-wrapper active">
            <div class="sidebar-header">
                <div class="d-flex justify-content-between">
                    <div class="logo">
<!--                        <a href="index.html"><img src="assets/images/logo/logo.png" alt="Logo" srcset=""></a>-->
                        <h1>BMS</h1>
                        <small>Bakery Management System</small>
                    </div>
                    <div class="toggler">
                        <a href="#" class="sidebar-hide d-xl-none d-block"><i class="bi bi-x bi-middle"></i></a>
                    </div>
                </div>
            </div>
            <div class="sidebar-menu">
                <ul class="menu">
                    <li class="sidebar-title">Menu</li>

                    <li class="sidebar-item">
                        <router-link to="dashboard" class='sidebar-link'>
                            <i class="bi bi-grid-fill"></i>
                            <span>Dashboard</span>
                        </router-link>
                    </li>

                    <li class="sidebar-item ">
                        <router-link :to="{ name: 'rawMaterial'}" class='sidebar-link'>
                            <i class="bi bi-stack"></i>
                            <span>Raw Materials</span>
                        </router-link>
                    </li>
                    <li class="sidebar-item ">
                        <router-link :to="{ name: 'products'}" class='sidebar-link'>
                            <i class="bi bi-circle-square"></i>
                            <span>Products</span>
                        </router-link>
                    </li>
                    <li class="sidebar-item ">
                        <router-link :to="{ name: 'dailyProducts'}" class='sidebar-link'>
                            <i class="bi bi-circle-square"></i>
                            <span>Daily Products</span>
                        </router-link>
                    </li>
                    <li class="sidebar-item  has-sub">
                        <a href="#" class='sidebar-link'>
                            <i class="bi bi-gear-fill"></i>
                            <span>Settings</span>
                        </a>
                        <ul class="submenu ">
                            <li class="submenu-item ">
                                <a href="component-alert.html">Alert</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="component-badge.html">Badge</a>
                            </li>
                        </ul>
                    </li>

                </ul>
            </div>
            <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
        </div>
    </div>
</template>

<script>
export default {
    name: "Sidebar"
}
</script>

<style scoped>

</style>
