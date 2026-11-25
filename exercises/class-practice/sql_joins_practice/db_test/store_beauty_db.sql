-- ============================================================
-- store_beauty_db - Esquema de base de datos
-- Motor: MySQL 8+ / MariaDB 11+  ·  Charset: utf8mb4
-- No borra nada: usa CREATE ... IF NOT EXISTS.
-- Orden de carga: DB_store_beauty_db.sql -> semilla_base.sql -> semilla_muestra.sql (opcional).
-- El administrador inicial NO se inserta aquí: lo crea el backend al arrancar
-- a partir de ADMIN_NAME, ADMIN_EMAIL y ADMIN_PASSWORD del .env.
-- ============================================================

CREATE DATABASE IF NOT EXISTS store_beauty_db
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE store_beauty_db;

-- ------------------------------------------------------------
-- Roles y usuarios del panel
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS roles (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(60) NOT NULL,
  slug VARCHAR(60) NOT NULL,
  descripcion VARCHAR(255) DEFAULT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uq_roles_slug (slug)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS usuarios (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  rol_id INT UNSIGNED NOT NULL,
  nombre VARCHAR(120) NOT NULL,
  email VARCHAR(150) NOT NULL,
  password VARCHAR(255) NOT NULL,
  telefono VARCHAR(30) DEFAULT NULL,
  activo TINYINT(1) NOT NULL DEFAULT 1,
  ultimo_acceso DATETIME DEFAULT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uq_usuarios_email (email),
  KEY idx_usuarios_rol (rol_id),
  CONSTRAINT fk_usuarios_rol FOREIGN KEY (rol_id) REFERENCES roles (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ------------------------------------------------------------
-- Catálogo
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS categorias (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(120) NOT NULL,
  slug VARCHAR(140) NOT NULL,
  descripcion VARCHAR(500) DEFAULT NULL,
  imagen VARCHAR(255) DEFAULT NULL,
  orden INT NOT NULL DEFAULT 0,
  activo TINYINT(1) NOT NULL DEFAULT 1,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uq_categorias_slug (slug),
  KEY idx_categorias_activo (activo, orden)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS marcas (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(120) NOT NULL,
  slug VARCHAR(140) NOT NULL,
  descripcion VARCHAR(500) DEFAULT NULL,
  imagen VARCHAR(255) DEFAULT NULL,
  activo TINYINT(1) NOT NULL DEFAULT 1,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uq_marcas_slug (slug),
  KEY idx_marcas_activo (activo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS productos (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  categoria_id INT UNSIGNED DEFAULT NULL,
  marca_id INT UNSIGNED DEFAULT NULL,
  nombre VARCHAR(200) NOT NULL,
  slug VARCHAR(220) NOT NULL,
  sku VARCHAR(80) NOT NULL,
  codigo_barras VARCHAR(80) DEFAULT NULL,
  descripcion_corta VARCHAR(500) DEFAULT NULL,
  descripcion TEXT,
  precio DECIMAL(10,2) NOT NULL DEFAULT 0,
  precio_anterior DECIMAL(10,2) DEFAULT NULL,
  precio_promocional DECIMAL(10,2) DEFAULT NULL,
  porcentaje_descuento DECIMAL(5,2) DEFAULT NULL,
  stock INT NOT NULL DEFAULT 0,
  stock_minimo INT NOT NULL DEFAULT 5,
  imagen VARCHAR(255) DEFAULT NULL,
  destacado TINYINT(1) NOT NULL DEFAULT 0,
  nuevo TINYINT(1) NOT NULL DEFAULT 0,
  en_promocion TINYINT(1) NOT NULL DEFAULT 0,
  promocion_inicio DATETIME DEFAULT NULL,
  promocion_fin DATETIME DEFAULT NULL,
  vendidos INT NOT NULL DEFAULT 0,
  activo TINYINT(1) NOT NULL DEFAULT 1,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uq_productos_sku (sku),
  UNIQUE KEY uq_productos_slug (slug),
  KEY idx_productos_categoria (categoria_id),
  KEY idx_productos_marca (marca_id),
  KEY idx_productos_activo (activo),
  KEY idx_productos_precio (precio),
  KEY idx_productos_destacado (destacado),
  KEY idx_productos_promocion (en_promocion),
  CONSTRAINT fk_productos_categoria FOREIGN KEY (categoria_id) REFERENCES categorias (id) ON DELETE SET NULL,
  CONSTRAINT fk_productos_marca FOREIGN KEY (marca_id) REFERENCES marcas (id) ON DELETE SET NULL,
  CONSTRAINT chk_productos_stock CHECK (stock >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS producto_imagenes (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  producto_id INT UNSIGNED NOT NULL,
  imagen VARCHAR(255) NOT NULL,
  principal TINYINT(1) NOT NULL DEFAULT 0,
  orden INT NOT NULL DEFAULT 0,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  KEY idx_pimg_producto (producto_id),
  CONSTRAINT fk_pimg_producto FOREIGN KEY (producto_id) REFERENCES productos (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ------------------------------------------------------------
-- Contenido del inicio
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS sliders (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  titulo VARCHAR(200) DEFAULT NULL,
  descripcion VARCHAR(500) DEFAULT NULL,
  imagen VARCHAR(255) NOT NULL,
  boton_texto VARCHAR(80) DEFAULT NULL,
  boton_enlace VARCHAR(255) DEFAULT NULL,
  orden INT NOT NULL DEFAULT 0,
  activo TINYINT(1) NOT NULL DEFAULT 1,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  KEY idx_sliders_activo (activo, orden)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS banners (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  titulo VARCHAR(200) DEFAULT NULL,
  descripcion VARCHAR(500) DEFAULT NULL,
  imagen VARCHAR(255) NOT NULL,
  enlace VARCHAR(255) DEFAULT NULL,
  posicion VARCHAR(30) NOT NULL DEFAULT 'home',
  orden INT NOT NULL DEFAULT 0,
  activo TINYINT(1) NOT NULL DEFAULT 1,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  KEY idx_banners_activo (activo, posicion, orden)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ------------------------------------------------------------
-- Clientes y favoritos
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS clientes (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(150) NOT NULL,
  documento VARCHAR(40) DEFAULT NULL,
  telefono VARCHAR(30) NOT NULL,
  whatsapp VARCHAR(30) DEFAULT NULL,
  email VARCHAR(150) NOT NULL,
  password VARCHAR(255) DEFAULT NULL,
  direccion VARCHAR(255) DEFAULT NULL,
  barrio VARCHAR(120) DEFAULT NULL,
  ciudad VARCHAR(120) DEFAULT NULL,
  departamento VARCHAR(120) DEFAULT NULL,
  activo TINYINT(1) NOT NULL DEFAULT 1,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uq_clientes_email (email),
  KEY idx_clientes_telefono (telefono)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS productos_favoritos (
  cliente_id INT UNSIGNED NOT NULL,
  producto_id INT UNSIGNED NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (cliente_id, producto_id),
  KEY idx_fav_producto (producto_id),
  CONSTRAINT fk_fav_cliente FOREIGN KEY (cliente_id) REFERENCES clientes (id) ON DELETE CASCADE,
  CONSTRAINT fk_fav_producto FOREIGN KEY (producto_id) REFERENCES productos (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ------------------------------------------------------------
-- Pagos, envíos y pedidos
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS metodos_pago (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(120) NOT NULL,
  slug VARCHAR(140) NOT NULL,
  descripcion VARCHAR(500) DEFAULT NULL,
  instrucciones TEXT,
  numero_cuenta VARCHAR(60) DEFAULT NULL,
  banco VARCHAR(120) DEFAULT NULL,
  titular VARCHAR(150) DEFAULT NULL,
  activo TINYINT(1) NOT NULL DEFAULT 1,
  orden INT NOT NULL DEFAULT 0,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uq_mp_slug (slug),
  KEY idx_mp_activo (activo, orden)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS metodos_envio (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(120) NOT NULL,
  slug VARCHAR(140) NOT NULL,
  costo DECIMAL(10,2) NOT NULL DEFAULT 0,
  descripcion VARCHAR(500) DEFAULT NULL,
  activo TINYINT(1) NOT NULL DEFAULT 1,
  orden INT NOT NULL DEFAULT 0,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uq_me_slug (slug),
  KEY idx_me_activo (activo, orden)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS pedidos (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  numero_pedido VARCHAR(30) NOT NULL,
  cliente_id INT UNSIGNED DEFAULT NULL,
  nombre VARCHAR(150) NOT NULL,
  documento VARCHAR(40) DEFAULT NULL,
  telefono VARCHAR(30) NOT NULL,
  whatsapp VARCHAR(30) DEFAULT NULL,
  email VARCHAR(150) DEFAULT NULL,
  direccion VARCHAR(255) DEFAULT NULL,
  barrio VARCHAR(120) DEFAULT NULL,
  ciudad VARCHAR(120) DEFAULT NULL,
  departamento VARCHAR(120) DEFAULT NULL,
  observaciones VARCHAR(500) DEFAULT NULL,
  metodo_pago_id INT UNSIGNED DEFAULT NULL,
  metodo_pago_nombre VARCHAR(120) DEFAULT NULL,
  metodo_entrega VARCHAR(40) NOT NULL DEFAULT 'domicilio',
  metodo_envio_nombre VARCHAR(120) DEFAULT NULL,
  subtotal DECIMAL(10,2) NOT NULL DEFAULT 0,
  descuento DECIMAL(10,2) NOT NULL DEFAULT 0,
  costo_envio DECIMAL(10,2) NOT NULL DEFAULT 0,
  total DECIMAL(10,2) NOT NULL DEFAULT 0,
  estado ENUM('pendiente','confirmado','preparando','enviado','entregado','cancelado') NOT NULL DEFAULT 'pendiente',
  pagado TINYINT(1) NOT NULL DEFAULT 0,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uq_pedidos_numero (numero_pedido),
  KEY idx_pedidos_cliente (cliente_id),
  KEY idx_pedidos_estado (estado),
  KEY idx_pedidos_fecha (created_at),
  KEY idx_pedidos_email (email),
  CONSTRAINT fk_pedidos_cliente FOREIGN KEY (cliente_id) REFERENCES clientes (id) ON DELETE SET NULL,
  CONSTRAINT fk_pedidos_pago FOREIGN KEY (metodo_pago_id) REFERENCES metodos_pago (id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS pedido_detalles (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  pedido_id INT UNSIGNED NOT NULL,
  producto_id INT UNSIGNED DEFAULT NULL,
  nombre_producto VARCHAR(200) NOT NULL,
  sku VARCHAR(80) DEFAULT NULL,
  imagen VARCHAR(255) DEFAULT NULL,
  precio DECIMAL(10,2) NOT NULL DEFAULT 0,
  precio_anterior DECIMAL(10,2) DEFAULT NULL,
  cantidad INT UNSIGNED NOT NULL DEFAULT 1,
  descuento DECIMAL(10,2) NOT NULL DEFAULT 0,
  subtotal DECIMAL(10,2) NOT NULL DEFAULT 0,
  PRIMARY KEY (id),
  KEY idx_pdet_pedido (pedido_id),
  KEY idx_pdet_producto (producto_id),
  CONSTRAINT fk_pdet_pedido FOREIGN KEY (pedido_id) REFERENCES pedidos (id) ON DELETE CASCADE,
  CONSTRAINT fk_pdet_producto FOREIGN KEY (producto_id) REFERENCES productos (id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ------------------------------------------------------------
-- Promociones (campañas)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS promociones (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(180) NOT NULL,
  slug VARCHAR(200) NOT NULL,
  descripcion VARCHAR(500) DEFAULT NULL,
  imagen VARCHAR(255) DEFAULT NULL,
  porcentaje DECIMAL(5,2) DEFAULT NULL,
  fecha_inicio DATETIME DEFAULT NULL,
  fecha_fin DATETIME DEFAULT NULL,
  activo TINYINT(1) NOT NULL DEFAULT 1,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uq_promos_slug (slug),
  KEY idx_promos_activo (activo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS promocion_productos (
  promocion_id INT UNSIGNED NOT NULL,
  producto_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (promocion_id, producto_id),
  KEY idx_pp_producto (producto_id),
  CONSTRAINT fk_pp_promocion FOREIGN KEY (promocion_id) REFERENCES promociones (id) ON DELETE CASCADE,
  CONSTRAINT fk_pp_producto FOREIGN KEY (producto_id) REFERENCES productos (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ------------------------------------------------------------
-- Boletín, contacto y configuración
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS newsletter (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(150) DEFAULT NULL,
  email VARCHAR(150) NOT NULL,
  activo TINYINT(1) NOT NULL DEFAULT 1,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uq_news_email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS contactos (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(150) NOT NULL,
  email VARCHAR(150) NOT NULL,
  telefono VARCHAR(30) DEFAULT NULL,
  mensaje TEXT NOT NULL,
  leido TINYINT(1) NOT NULL DEFAULT 0,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  KEY idx_contactos_leido (leido, created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS configuracion (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  clave VARCHAR(120) NOT NULL,
  valor TEXT,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uq_config_clave (clave)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
