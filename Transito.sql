-- Generado por Oracle SQL Developer Data Modeler 17.4.0.355.2131
--   en:        2018-05-08 16:31:54 COT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE accidente (
    fecha                          DATE NOT NULL,
    croquis                        BLOB NOT NULL,
    numero_accidente               INTEGER NOT NULL,
    tipoaccidente_fk               INTEGER NOT NULL,
    caracteristicaslugar_fk        INTEGER NOT NULL,
    oficina_id_oficina             INTEGER NOT NULL,
    caracteristicasvia_fk          INTEGER NOT NULL,
    gravedad                       VARCHAR2(15),
    accidentevehiculo_placa        VARCHAR2(6) NOT NULL,
    numero_documento_propietario   INTEGER NOT NULL,
    propietario_conductor          CHAR(2) NOT NULL,
    clase_accidente                VARCHAR2(100) NOT NULL,
    choque_con                     VARCHAR2(40) NOT NULL,
    objeto_fijo                    VARCHAR2(30),
    lugar                          VARCHAR2(70) NOT NULL,
    localidad_comuna               VARCHAR2(30),
    dia_semana                     VARCHAR2(10) NOT NULL,
    hora_ocurrencia                DATE NOT NULL,
    hora_levantamiento             DATE
);

ALTER TABLE accidente ADD CONSTRAINT accidente_pk PRIMARY KEY ( numero_accidente );

ALTER TABLE accidente ADD CONSTRAINT accidente__un UNIQUE ( numero_documento_propietario );

CREATE TABLE accidenteconductor (
    accidente_id_accidente       INTEGER NOT NULL,
    conductor_numero_documento   INTEGER NOT NULL
);

CREATE TABLE accidentevehiculo (
    placa                          VARCHAR2(6) NOT NULL,
    numero_vehiculo                INTEGER NOT NULL,
    carga                          INTEGER,
    numero_pasajeros               INTEGER NOT NULL,
    color_id_color                 INTEGER NOT NULL,
    inmovilizado                   VARCHAR2(70),
    disposicion                    VARCHAR2(50),
    seguro_obligatorio             CHAR(2) NOT NULL,
    numero_poliza                  INTEGER,
    compañia_aseguradora           VARCHAR2(60),
    fecha_vencimiento              DATE,
    clase                          VARCHAR2(20) NOT NULL,
    servicio                       VARCHAR2(20) NOT NULL,
    seguro_responsabilidad_civil   CHAR(2) NOT NULL,
    nacionalidad                   VARCHAR2(10) NOT NULL,
    falla                          VARCHAR2(100)
);

ALTER TABLE accidentevehiculo ADD CONSTRAINT accidentevehiculo_pk PRIMARY KEY ( placa );

ALTER TABLE accidentevehiculo ADD CONSTRAINT accidentevehiculo__un UNIQUE ( placa,
numero_vehiculo );

CREATE TABLE agentetransito (
    placa         INTEGER NOT NULL,
    nombre        VARCHAR2(25) NOT NULL,
    apellido      VARCHAR2(25) NOT NULL,
    entidad       VARCHAR2(20) NOT NULL,
    observacion   VARCHAR2(100) NOT NULL
);

ALTER TABLE agentetransito ADD CONSTRAINT agentetransito_pk PRIMARY KEY ( placa );

CREATE TABLE caracteristicaslugar (
    area                       VARCHAR2(10) NOT NULL,
    sector                     VARCHAR2(20) NOT NULL,
    zona                       VARCHAR2(10) NOT NULL,
    diseño                     VARCHAR2(20) NOT NULL,
    tiempo                     VARCHAR2(10),
    id_caracteristicas_lugar   INTEGER NOT NULL
);

ALTER TABLE caracteristicaslugar ADD CONSTRAINT caracteristicaslugar_pk PRIMARY KEY ( id_caracteristicas_lugar );

CREATE TABLE caracteristicasvia (
    geometrica               VARCHAR2(100) NOT NULL,
    utilizacion              VARCHAR2(20),
    calzada                  VARCHAR2(20),
    carriles                 VARCHAR2(20),
    material                 VARCHAR2(10) NOT NULL,
    estado                   VARCHAR2(20),
    condiciones              VARCHAR2(20),
    iluminacionartificial    VARCHAR2(10),
    visual_disminuida_por    VARCHAR2(30),
    controles_id_controles   INTEGER NOT NULL,
    id_caracteristica_via    INTEGER NOT NULL,
    caracteristicasvia_fk    INTEGER
);

ALTER TABLE caracteristicasvia ADD CONSTRAINT caracteristicasvia_pk PRIMARY KEY ( id_caracteristica_via );

CREATE TABLE carroceria (
    codigo   INTEGER NOT NULL,
    tipo     VARCHAR2(200) NOT NULL
);

ALTER TABLE carroceria ADD CONSTRAINT carroceria_pk PRIMARY KEY ( codigo );

CREATE TABLE categoria (
    codigo        INTEGER NOT NULL,
    descirpción   VARCHAR2(100) NOT NULL
);

ALTER TABLE categoria ADD CONSTRAINT categoria_pk PRIMARY KEY ( codigo );

CREATE TABLE causasprobables (
    numero_vehivulo     INTEGER NOT NULL,
    codigo_causa        INTEGER NOT NULL,
    version_conductor   VARCHAR2(500) NOT NULL
);

ALTER TABLE causasprobables ADD CONSTRAINT causasprobables_pk PRIMARY KEY ( numero_vehivulo );

CREATE TABLE certificadotradicion (
    tipo_documento     VARCHAR2(30) NOT NULL,
    numero_documento   INTEGER NOT NULL,
    hora               DATE NOT NULL,
    fecha              DATE NOT NULL,
    motivo_solicitud   VARCHAR2(100) NOT NULL
);

ALTER TABLE certificadotradicion ADD CONSTRAINT certificadotradicion_pk PRIMARY KEY ( numero_documento );

CREATE TABLE color (
    id_color        INTEGER NOT NULL,
    dedescripcion   VARCHAR2(20) NOT NULL
);

ALTER TABLE color ADD CONSTRAINT color_pk PRIMARY KEY ( id_color );

CREATE TABLE combustible (
    id_combustible   INTEGER NOT NULL,
    detalle          VARCHAR2(200) NOT NULL
);

ALTER TABLE combustible ADD CONSTRAINT combustible_pk PRIMARY KEY ( id_combustible );

CREATE TABLE comparendo (
    numero_comparendo                      INTEGER NOT NULL,
    fecha                                  DATE NOT NULL,
    hora                                   DATE NOT NULL,
    vehiculo_placa_letras                  VARCHAR2(3) NOT NULL,
    clase_servicio                         VARCHAR2(20) NOT NULL,
    radio_accion                           VARCHAR2(20),
    modalidad_transporte                   VARCHAR2(20),
    transporte_pasajeros                   VARCHAR2(200),
    infraccion_codigo                      INTEGER NOT NULL,
    lugar_municipio                        VARCHAR2(30) NOT NULL,
    lugar_localidad                        VARCHAR2(30) NOT NULL,
    lugar_comuna                           INTEGER NOT NULL,
    empresa_nit                            INTEGER,
    agentetransito_placa                   INTEGER NOT NULL,
    inmovilizacion                         INTEGER,
    testigo_numero_documento               INTEGER,
    multa                                  INTEGER NOT NULL,
    curso_id_curso                         INTEGER NOT NULL,
    persona_numero_documento               INTEGER, 
    infractor_numero_documento   INTEGER NOT NULL
);

ALTER TABLE comparendo ADD CONSTRAINT comparendo_pk PRIMARY KEY ( numero_comparendo );

ALTER TABLE comparendo ADD CONSTRAINT comparendo__un UNIQUE ( inmovilizacion );

CREATE TABLE conductor (
    numero_documento           INTEGER NOT NULL,
    fecha_nacimiento           DATE NOT NULL,
    genero                     CHAR(10) NOT NULL,
    muerto                     CHAR(2),
    herido                     CHAR(2),
    porta_licencia             CHAR(2) NOT NULL,
    numero_licencia            INTEGER,
    categoria                  VARCHAR2(200),
    restriccion                VARCHAR2(3),
    fecha_expedicion           DATE,
    fecha_vencimiento          DATE,
    oficina_transito           INTEGER NOT NULL,
    cinturon                   CHAR(2),
    lugar_atencion             VARCHAR2(70),
    exman                      VARCHAR2(10) NOT NULL,
    respuesta                  VARCHAR2(10) NOT NULL,
    grado                      INTEGER,
    casco                      CHAR(2),
    licencia_numero_licencia   INTEGER NOT NULL
);

ALTER TABLE conductor ADD CONSTRAINT conductor_pk PRIMARY KEY ( numero_documento );

ALTER TABLE conductor ADD CONSTRAINT conductor__un UNIQUE ( numero_documento,
licencia_numero_licencia );

CREATE TABLE controles (
    agente         CHAR(2),
    semaforo       VARCHAR2(15),
    seniales       VARCHAR2(15),
    demarcacion    VARCHAR2(20),
    id_controles   INTEGER NOT NULL
);

ALTER TABLE controles ADD CONSTRAINT controles_pk PRIMARY KEY ( id_controles );

CREATE TABLE curso (
    descripcion         VARCHAR2(100) NOT NULL,
    fecha_realizacion   DATE NOT NULL,
    id_curso            INTEGER NOT NULL
);

ALTER TABLE curso ADD CONSTRAINT curso_pk PRIMARY KEY ( id_curso );

CREATE TABLE datosalerta (
    id_dato_alerta       INTEGER NOT NULL,
    detalle              VARCHAR2(200) NOT NULL,
    a_favor              VARCHAR2(50),
    tramite_id_tramite   INTEGER NOT NULL
);

ALTER TABLE datosalerta ADD CONSTRAINT datosalerta_pk PRIMARY KEY ( id_dato_alerta );

CREATE TABLE departamento (
    id_departamento   INTEGER NOT NULL,
    nombre            VARCHAR2(30) NOT NULL
);

ALTER TABLE departamento ADD CONSTRAINT departamento_pk PRIMARY KEY ( id_departamento );

CREATE TABLE empresa (
    nit                        INTEGER NOT NULL,
    nombre_empresa             VARCHAR2(30) NOT NULL,
    numero_tarjeta_operacion   INTEGER NOT NULL
);

ALTER TABLE empresa ADD CONSTRAINT empresa_pk PRIMARY KEY ( nit );

CREATE TABLE empresatramite (
    nit      INTEGER NOT NULL,
    nombre   VARCHAR2(50) NOT NULL
);

ALTER TABLE empresatramite ADD CONSTRAINT empresatramite_pk PRIMARY KEY ( nit );

CREATE TABLE factura (
    fecha_pago          DATE NOT NULL,
    valor_pago          INTEGER NOT NULL,
    cuota               INTEGER NOT NULL,
    numero_comparendo   INTEGER NOT NULL,
    numero_factura      INTEGER NOT NULL,
    interes             INTEGER
);

ALTER TABLE factura ADD CONSTRAINT pago_pk PRIMARY KEY ( numero_factura );

ALTER TABLE factura ADD CONSTRAINT pago__un UNIQUE ( numero_comparendo );

CREATE TABLE importacion (
    tipo                      VARCHAR2(20),
    declaracion_importacion   INTEGER,
    numero_documento          INTEGER NOT NULL,
    fecha                     DATE
);

ALTER TABLE importacion ADD CONSTRAINT importacion_pk PRIMARY KEY ( numero_documento );

CREATE TABLE infraccion (
    codigo        INTEGER NOT NULL,
    descripcion   VARCHAR2(100) NOT NULL,
    valor         INTEGER NOT NULL
);

ALTER TABLE infraccion ADD CONSTRAINT infraccion_pk PRIMARY KEY ( codigo );

CREATE TABLE infractor (
    conductor_numero_documento   INTEGER NOT NULL,
    numero_licencia              INTEGER NOT NULL,
    categoria                    INTEGER NOT NULL,
    fecha_expedicion             DATE NOT NULL,
    edad                         INTEGER NOT NULL,
    correo_electronico           VARCHAR2(70)
);

ALTER TABLE infractor ADD CONSTRAINT infractor_pk PRIMARY KEY ( conductor_numero_documento );

CREATE TABLE inmovilizacion (
    id_inmovilizavion   INTEGER NOT NULL,
    numero_patio        INTEGER NOT NULL,
    direccion_patio     VARCHAR2(70) NOT NULL,
    numero_grua         INTEGER,
    placa_grua          INTEGER NOT NULL,
    consecutivo         INTEGER NOT NULL
);

ALTER TABLE inmovilizacion ADD CONSTRAINT inmovilizacion_pk PRIMARY KEY ( id_inmovilizavion );

CREATE TABLE licencia (
    numero_licencia     INTEGER NOT NULL,
    fecha_nacimiento    DATE,
    fecha_expedicion    DATE,
    fecha_vencimiento   DATE,
    restricciones       VARCHAR2(200),
    tipo_sangre         VARCHAR2(5),
    categoria_codigo    INTEGER NOT NULL
);

ALTER TABLE licencia ADD CONSTRAINT licencia_pk PRIMARY KEY ( numero_licencia );

CREATE TABLE lugar (
    municipio             VARCHAR2(30) NOT NULL,
    localidad             VARCHAR2(30) NOT NULL,
    comuna                INTEGER NOT NULL,
    tipo_via              INTEGER NOT NULL,
    nombre                VARCHAR2(30) NOT NULL,
    numero                INTEGER NOT NULL,
    viaprincipal_id_via   INTEGER NOT NULL
);

ALTER TABLE lugar
    ADD CONSTRAINT lugar_pk PRIMARY KEY ( municipio,
    localidad,
    comuna );

ALTER TABLE lugar
    ADD CONSTRAINT lugar__un UNIQUE ( tipo_via,
    nombre,
    numero );

CREATE TABLE municipio (
    id_muncipio                    INTEGER NOT NULL,
    nombre                         VARCHAR2(30) NOT NULL,
    departamento_id_departamento   INTEGER NOT NULL
);

ALTER TABLE municipio ADD CONSTRAINT municipio_pk PRIMARY KEY ( id_muncipio );

CREATE TABLE oficina (
    id_oficina    INTEGER NOT NULL,
    descripcion   VARCHAR2(100) NOT NULL
);

ALTER TABLE oficina ADD CONSTRAINT oficina_pk PRIMARY KEY ( id_oficina );

CREATE TABLE organismotramite (
    tramite_id_tramite         INTEGER NOT NULL,
    organismotransito_codigo   INTEGER NOT NULL
);

ALTER TABLE organismotramite ADD CONSTRAINT organismotramite_pk PRIMARY KEY ( tramite_id_tramite,
organismotransito_codigo );

CREATE TABLE organismotransito (
    codigo          INTEGER NOT NULL,
    nombre          VARCHAR2(40) NOT NULL,
    ciudad          VARCHAR2(100) NOT NULL,
    fecha_tramite   DATE NOT NULL
);

ALTER TABLE organismotransito ADD CONSTRAINT organismotransito_pk PRIMARY KEY ( codigo );

CREATE TABLE persona (
    tipo_documento          VARCHAR2(30) NOT NULL,
    numero_documento        INTEGER NOT NULL,
    nombre                  VARCHAR2(25) NOT NULL,
    apellido                VARCHAR2(25) NOT NULL,
    direccion               VARCHAR2(70) NOT NULL,
    municipio_id_muncipio   INTEGER NOT NULL
);

ALTER TABLE persona ADD CONSTRAINT usuario_pk PRIMARY KEY ( numero_documento );

CREATE TABLE propietario (
    numero_documento   INTEGER NOT NULL
);

ALTER TABLE propietario ADD CONSTRAINT propietario_pk PRIMARY KEY ( numero_documento );

CREATE TABLE remate (
    acta               INTEGER,
    entidad            INTEGER,
    lugar              VARCHAR2(30),
    codigo             INTEGER,
    numero_documento   INTEGER NOT NULL,
    fecha              DATE
);

ALTER TABLE remate ADD CONSTRAINT remate_pk PRIMARY KEY ( numero_documento );

CREATE TABLE requisito (
    id_requisito   INTEGER NOT NULL,
    descripcion    VARCHAR2(100) NOT NULL
);

ALTER TABLE requisito ADD CONSTRAINT requisito_pk PRIMARY KEY ( id_requisito );

CREATE TABLE sancion (
    id_sancion    INTEGER NOT NULL,
    descripcion   VARCHAR2(100) NOT NULL
);

ALTER TABLE sancion ADD CONSTRAINT sancion_pk PRIMARY KEY ( id_sancion );

CREATE TABLE sancioninfraccion (
    infraccion_codigo    INTEGER NOT NULL,
    sancion_id_sancion   INTEGER NOT NULL
);

ALTER TABLE sancioninfraccion ADD CONSTRAINT sancioninfraccion_pk PRIMARY KEY ( infraccion_codigo,
sancion_id_sancion );

CREATE TABLE telefono (
    numero_telefono            INTEGER NOT NULL,
    usuario_numero_documento   INTEGER NOT NULL
);

ALTER TABLE telefono ADD CONSTRAINT telefono_pk PRIMARY KEY ( numero_telefono );

CREATE TABLE tipoaccidente (
    id_tipo_accidente   INTEGER NOT NULL,
    descripcion         VARCHAR2(30)
);

ALTER TABLE tipoaccidente ADD CONSTRAINT tipoaccidente_pk PRIMARY KEY ( id_tipo_accidente );

CREATE TABLE tipotramite (
    id_tramite   INTEGER NOT NULL,
    nombre       VARCHAR2(30) NOT NULL,
    valor        INTEGER NOT NULL
);

ALTER TABLE tipotramite ADD CONSTRAINT tipotramite_pk PRIMARY KEY ( id_tramite );

CREATE TABLE tipousuario (
    id_tipo_usuario   INTEGER NOT NULL,
    descripcion       VARCHAR2(30) NOT NULL
);

ALTER TABLE tipousuario ADD CONSTRAINT tipousuario_pk PRIMARY KEY ( id_tipo_usuario );

CREATE TABLE tipovehiculo (
    id_tipo_vehiculo   INTEGER NOT NULL,
    descripcion        VARCHAR2(50) NOT NULL
);

ALTER TABLE tipovehiculo ADD CONSTRAINT tipovehiculo_pk PRIMARY KEY ( id_tipo_vehiculo );

CREATE TABLE tramite (
    id_tramite                 INTEGER NOT NULL,
    descripcion                VARCHAR2(100) NOT NULL,
    usuario_identificacion     INTEGER NOT NULL,
    usuario2_identificacion1   INTEGER,
    nit                        INTEGER NOT NULL,
    vehiculotramite_placa      VARCHAR2(6) NOT NULL,
    tipotramite_id_tramite     INTEGER NOT NULL
);

ALTER TABLE tramite ADD CONSTRAINT tramite_pk PRIMARY KEY ( id_tramite );

ALTER TABLE tramite ADD CONSTRAINT tramite__un UNIQUE ( nit );

CREATE TABLE tramite_requisito (
    tramite_id_tramite       INTEGER NOT NULL,
    requisito_id_requisito   INTEGER NOT NULL
);

ALTER TABLE tramite_requisito ADD CONSTRAINT matriculainicial_pk PRIMARY KEY ( tramite_id_tramite,
requisito_id_requisito );

CREATE TABLE usuario (
    nombre_usuario                VARCHAR2(50) NOT NULL,
    password                      VARCHAR2(20) NOT NULL,
    tipousuario_id_tipo_usuario   INTEGER NOT NULL,
    numero_documento              INTEGER NOT NULL
);

ALTER TABLE usuario ADD CONSTRAINT usuario__un UNIQUE ( numero_documento );

CREATE TABLE vehiculo (
    propietario_numero_documento    INTEGER NOT NULL,
    tipovehiculo_id_tipo_vehiculo   INTEGER NOT NULL,
    placa                           VARCHAR2(6) NOT NULL,
    lugar_matricula                 VARCHAR2(30) NOT NULL
);

ALTER TABLE vehiculo ADD CONSTRAINT vehiculo_pk PRIMARY KEY ( placa );

CREATE TABLE vehiculotramite (
    marca                          VARCHAR2(40) NOT NULL,
    linea                          VARCHAR2(50) NOT NULL,
    combustible                    INTEGER NOT NULL,
    color_id_color                 INTEGER NOT NULL,
    modelo                         INTEGER NOT NULL,
    cilindrada                     INTEGER NOT NULL,
    capacidad                      INTEGER,
    blindaje                       CHAR(2),
    numero_resolucion              DATE,
    desmontaje_blindaje            CHAR(2),
    numero_resolucion_1            DATE,
    potencia                       INTEGER NOT NULL,
    importacion_numero_documento   INTEGER,
    remate_numero_documento        INTEGER,
    carroceria_codigo              INTEGER,
    numero_motor                   INTEGER NOT NULL,
    regrabado_motor                CHAR(2),
    numero_chasis                  INTEGER NOT NULL,
    regrabado_chasis               CHAR(2),
    numero_serie                   INTEGER NOT NULL,
    regrabado_serie                CHAR(2),
    placa                          VARCHAR2(6) NOT NULL
);

ALTER TABLE vehiculotramite ADD CONSTRAINT vehiculotramite_pk PRIMARY KEY ( placa );

CREATE TABLE viaprincipal (
    tipo_via         INTEGER NOT NULL,
    nombre           VARCHAR2(30) NOT NULL,
    numero           INTEGER NOT NULL,
    via_secundaria   VARCHAR2(70),
    id_via           INTEGER NOT NULL
);

ALTER TABLE viaprincipal ADD CONSTRAINT viaprincipal_pk PRIMARY KEY ( id_via );

ALTER TABLE viaprincipal
    ADD CONSTRAINT viaprincipal__un UNIQUE ( tipo_via,
    nombre,
    numero );

ALTER TABLE accidente
    ADD CONSTRAINT accidente_accidentevehiculo_fk FOREIGN KEY ( accidentevehiculo_placa )
        REFERENCES accidentevehiculo ( placa );

ALTER TABLE accidente
    ADD CONSTRAINT accidente_lugar_fk FOREIGN KEY ( caracteristicaslugar_fk )
        REFERENCES caracteristicaslugar ( id_caracteristicas_lugar );
 
ALTER TABLE accidente
    ADD CONSTRAINT accidente_via_fk FOREIGN KEY ( caracteristicasvia_fk )
        REFERENCES caracteristicasvia ( id_caracteristica_via );

ALTER TABLE accidente
    ADD CONSTRAINT accidente_oficina_fk FOREIGN KEY ( oficina_id_oficina )
        REFERENCES oficina ( id_oficina );

ALTER TABLE accidente
    ADD CONSTRAINT accidente_propietario_fk FOREIGN KEY ( numero_documento_propietario )
        REFERENCES propietario ( numero_documento );

ALTER TABLE accidente
    ADD CONSTRAINT accidente_tipoaccidente_fk FOREIGN KEY ( tipoaccidente_fk )
        REFERENCES tipoaccidente ( id_tipo_accidente );

ALTER TABLE accidenteconductor
    ADD CONSTRAINT accidente_conductor_fk FOREIGN KEY ( conductor_numero_documento )
        REFERENCES conductor ( numero_documento );
 
ALTER TABLE accidenteconductor
    ADD CONSTRAINT infractor_accidente_fk FOREIGN KEY ( accidente_id_accidente )
        REFERENCES accidente ( numero_accidente );

ALTER TABLE accidentevehiculo
    ADD CONSTRAINT accidentevehiculo_vehiculo_fk FOREIGN KEY ( placa )
        REFERENCES vehiculo ( placa );

ALTER TABLE accidentevehiculo
    ADD CONSTRAINT accidentevehiculov1_color_fk FOREIGN KEY ( color_id_color )
        REFERENCES color ( id_color );

ALTER TABLE caracteristicasvia
    ADD CONSTRAINT via_caracteristicasvia_fk FOREIGN KEY ( caracteristicasvia_fk )
        REFERENCES caracteristicasvia ( id_caracteristica_via );

ALTER TABLE caracteristicasvia
    ADD CONSTRAINT via_controles_fk FOREIGN KEY ( controles_id_controles )
        REFERENCES controles ( id_controles );

ALTER TABLE licencia
    ADD CONSTRAINT categoria_licencia_fk FOREIGN KEY ( categoria_codigo )
        REFERENCES categoria ( codigo );

ALTER TABLE comparendo
    ADD CONSTRAINT comparendo_agentetransito_fk FOREIGN KEY ( agentetransito_placa )
        REFERENCES agentetransito ( placa );

ALTER TABLE comparendo
    ADD CONSTRAINT comparendo_curso_fk FOREIGN KEY ( curso_id_curso )
        REFERENCES curso ( id_curso );

ALTER TABLE comparendo
    ADD CONSTRAINT comparendo_empresa_fk FOREIGN KEY ( empresa_nit )
        REFERENCES empresa ( nit );

ALTER TABLE comparendo
    ADD CONSTRAINT comparendo_infraccion_fk FOREIGN KEY ( infraccion_codigo )
        REFERENCES infraccion ( codigo );

ALTER TABLE comparendo
    ADD CONSTRAINT comparendo_infractor_fk FOREIGN KEY ( infractor_numero_documento )
        REFERENCES infractor ( conductor_numero_documento );

ALTER TABLE comparendo
    ADD CONSTRAINT comparendo_inmovilizacion_fk FOREIGN KEY ( inmovilizacion )
        REFERENCES inmovilizacion ( id_inmovilizavion );

ALTER TABLE comparendo
    ADD CONSTRAINT comparendo_lugar_fk FOREIGN KEY ( lugar_municipio,
    lugar_localidad,
    lugar_comuna )
        REFERENCES lugar ( municipio,
        localidad,
        comuna );

ALTER TABLE comparendo
    ADD CONSTRAINT comparendo_vehiculo_fk FOREIGN KEY ( vehiculo_placa_letras )
        REFERENCES vehiculo ( placa );

ALTER TABLE conductor
    ADD CONSTRAINT conductor_persona_fk FOREIGN KEY ( numero_documento )
        REFERENCES persona ( numero_documento );

ALTER TABLE datosalerta
    ADD CONSTRAINT datosalerta_tramite_fk FOREIGN KEY ( tramite_id_tramite )
        REFERENCES tramite ( id_tramite );

ALTER TABLE factura
    ADD CONSTRAINT factura_comparendo_fk FOREIGN KEY ( numero_comparendo )
        REFERENCES comparendo ( numero_comparendo );

ALTER TABLE infractor
    ADD CONSTRAINT infractor_conductor_fk FOREIGN KEY ( conductor_numero_documento )
        REFERENCES conductor ( numero_documento );

ALTER TABLE lugar
    ADD CONSTRAINT lugar_viaprincipal_fk FOREIGN KEY ( viaprincipal_id_via )
        REFERENCES viaprincipal ( id_via );

ALTER TABLE municipio
    ADD CONSTRAINT municipio_departamento_fk FOREIGN KEY ( departamento_id_departamento )
        REFERENCES departamento ( id_departamento );

ALTER TABLE conductor
    ADD CONSTRAINT numero_licencia FOREIGN KEY ( licencia_numero_licencia )
        REFERENCES licencia ( numero_licencia );

ALTER TABLE organismotramite
    ADD CONSTRAINT tramite_organismotransito_fk FOREIGN KEY ( organismotransito_codigo )
        REFERENCES organismotransito ( codigo );

ALTER TABLE organismotramite
    ADD CONSTRAINT organismotramite_tramite_fk FOREIGN KEY ( tramite_id_tramite )
        REFERENCES tramite ( id_tramite );

ALTER TABLE propietario
    ADD CONSTRAINT propietario_persona_fk FOREIGN KEY ( numero_documento )
        REFERENCES persona ( numero_documento );

ALTER TABLE tramite_requisito
    ADD CONSTRAINT requisito_tramite_fk FOREIGN KEY ( requisito_id_requisito )
        REFERENCES requisito ( id_requisito );

ALTER TABLE sancioninfraccion
    ADD CONSTRAINT sancion_infraccion_fk FOREIGN KEY ( infraccion_codigo )
        REFERENCES infraccion ( codigo );

ALTER TABLE sancioninfraccion
    ADD CONSTRAINT sancioninfraccion_sancion_fk FOREIGN KEY ( sancion_id_sancion )
        REFERENCES sancion ( id_sancion );

ALTER TABLE telefono
    ADD CONSTRAINT telefono_usuario_fk FOREIGN KEY ( usuario_numero_documento )
        REFERENCES persona ( numero_documento );

ALTER TABLE comparendo
    ADD CONSTRAINT testigo_fk FOREIGN KEY ( persona_numero_documento )
        REFERENCES persona ( numero_documento );

ALTER TABLE tramite
    ADD CONSTRAINT tipo_tramite_fk FOREIGN KEY ( tipotramite_id_tramite )
        REFERENCES tipotramite ( id_tramite );

ALTER TABLE tramite
    ADD CONSTRAINT tramite_empresatramite_fk FOREIGN KEY ( nit )
        REFERENCES empresatramite ( nit );

ALTER TABLE tramite_requisito
    ADD CONSTRAINT tramite_requisito_fk FOREIGN KEY ( tramite_id_tramite )
        REFERENCES tramite ( id_tramite );

ALTER TABLE tramite
    ADD CONSTRAINT tramite_usuario_fk FOREIGN KEY ( usuario_identificacion )
        REFERENCES persona ( numero_documento );

ALTER TABLE tramite
    ADD CONSTRAINT tramite_vehiculotramite_fk FOREIGN KEY ( vehiculotramite_placa )
        REFERENCES vehiculotramite ( placa );

ALTER TABLE persona
    ADD CONSTRAINT usuario_municipio_fk FOREIGN KEY ( municipio_id_muncipio )
        REFERENCES municipio ( id_muncipio );

ALTER TABLE usuario
    ADD CONSTRAINT usuario_persona_fk FOREIGN KEY ( numero_documento )
        REFERENCES persona ( numero_documento );

ALTER TABLE usuario
    ADD CONSTRAINT usuario_tipousuario_fk FOREIGN KEY ( tipousuario_id_tipo_usuario )
        REFERENCES tipousuario ( id_tipo_usuario );

ALTER TABLE tramite
    ADD CONSTRAINT usuario2_fk FOREIGN KEY ( usuario2_identificacion1 )
        REFERENCES persona ( numero_documento );

ALTER TABLE vehiculo
    ADD CONSTRAINT vehiculo_propietario_fk FOREIGN KEY ( propietario_numero_documento )
        REFERENCES propietario ( numero_documento );

ALTER TABLE vehiculo
    ADD CONSTRAINT vehiculo_tipovehiculo_fk FOREIGN KEY ( tipovehiculo_id_tipo_vehiculo )
        REFERENCES tipovehiculo ( id_tipo_vehiculo );

ALTER TABLE vehiculotramite
    ADD CONSTRAINT vehiculotramite_carroceria_fk FOREIGN KEY ( carroceria_codigo )
        REFERENCES carroceria ( codigo );

ALTER TABLE vehiculotramite
    ADD CONSTRAINT vehiculotramite_color_fk FOREIGN KEY ( color_id_color )
        REFERENCES color ( id_color );

ALTER TABLE vehiculotramite
    ADD CONSTRAINT vehiculotramite_importacion_fk FOREIGN KEY ( importacion_numero_documento )
        REFERENCES importacion ( numero_documento );

ALTER TABLE vehiculotramite
    ADD CONSTRAINT vehiculotramite_remate_fk FOREIGN KEY ( remate_numero_documento )
        REFERENCES remate ( numero_documento );

ALTER TABLE vehiculotramite
    ADD CONSTRAINT vehiculotramite_vehiculo_fk FOREIGN KEY ( placa )
        REFERENCES vehiculo ( placa );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            48
-- CREATE INDEX                             0
-- ALTER TABLE                            110
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                  10
-- WARNINGS                                 0
