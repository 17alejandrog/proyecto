/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author Alejandro
 */
public class Equipo {
    String serial;
    String marca;
    String marcaBoard;
    String referenciaBoard;
    String ram;
    String disco;
    String procesador;
    String monitor;
    String teclado;
    String serialMonitor;
    String serialTeclado;
    
    public Equipo(){
        
    }

    public Equipo(String serial, String marca, String marcaBoard, String referenciaBoard, String ram, String disco, String procesador, String monitor, String teclado, String serialMonitor, String serialTeclado) {
        this.serial = serial;
        this.marca = marca;
        this.marcaBoard = marcaBoard;
        this.referenciaBoard = referenciaBoard;
        this.ram = ram;
        this.disco = disco;
        this.procesador = procesador;
        this.monitor = monitor;
        this.teclado = teclado;
        this.serialMonitor = serialMonitor;
        this.serialTeclado = serialTeclado;
    }

    public String getSerial() {
        return serial;
    }

    public void setSerial(String serial) {
        this.serial = serial;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getMarcaBoard() {
        return marcaBoard;
    }

    public void setMarcaBoard(String marcaBoard) {
        this.marcaBoard = marcaBoard;
    }

    public String getReferenciaBoard() {
        return referenciaBoard;
    }

    public void setReferenciaBoard(String referenciaBoard) {
        this.referenciaBoard = referenciaBoard;
    }

    public String getRam() {
        return ram;
    }

    public void setRam(String ram) {
        this.ram = ram;
    }

    public String getDisco() {
        return disco;
    }

    public void setDisco(String disco) {
        this.disco = disco;
    }

    public String getProcesador() {
        return procesador;
    }

    public void setProcesador(String procesador) {
        this.procesador = procesador;
    }

    public String getMonitor() {
        return monitor;
    }

    public void setMonitor(String monitor) {
        this.monitor = monitor;
    }

    public String getTeclado() {
        return teclado;
    }

    public void setTeclado(String teclado) {
        this.teclado = teclado;
    }

    public String getSerialMonitor() {
        return serialMonitor;
    }

    public void setSerialMonitor(String serialMonitor) {
        this.serialMonitor = serialMonitor;
    }

    public String getSerialTeclado() {
        return serialTeclado;
    }

    public void setSerialTeclado(String serialTeclado) {
        this.serialTeclado = serialTeclado;
    }
    
    


    
    
    
    
}
