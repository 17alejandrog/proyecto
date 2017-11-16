/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Equipo;

import java.util.ArrayList;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Alejandro
 */
public class CtlEquipo {

    static ArrayList<Equipo> listaEquipo = new ArrayList<Equipo>();

    public boolean registrarInsumo(String serial, String marca, String marcaBoard, String referenciaBoard, String ram, String disco, String procesador, String monitor, String teclado, String serialMonitor, String serialTeclado) {
        int band = 0;
        Equipo equipo = new Equipo(serial, marca, marcaBoard, referenciaBoard, ram, disco, procesador, monitor, teclado, serialMonitor, serialTeclado);
        if (listaEquipo.isEmpty()) {
            listaEquipo.add(equipo);
            return true;
        } else {
            for (int i = 0; i < listaEquipo.size(); i++) {
                if ((equipo.getSerial().equals(listaEquipo.get(i).getSerial()))) {
                    band = 1;
                }

            }
            if (band == 0) {
                listaEquipo.add(equipo);
                return true;
            } else {
                JOptionPane.showMessageDialog(null, "Ya se encuentra registrado este equipo");
            }
        }
        return false;
    }

    public DefaultTableModel listar() {
        DefaultTableModel modelo = new DefaultTableModel();
        String nombreColumnas[] = {"Serial", "Marca", "MarcaBoard", "ReferenciaBoard", "Ram", "Disco", "Procesador", "Monitor", "Teclado", "SerialMonitor", "SerialTeclado"};
        modelo = new DefaultTableModel(new Object[][]{}, nombreColumnas);
        for (int i = 0; i < listaEquipo.size(); i++) {
            modelo.addRow(new Object[]{
                listaEquipo.get(i).getSerial(),
                listaEquipo.get(i).getMarca(),
                listaEquipo.get(i).getMarcaBoard(),
                listaEquipo.get(i).getReferenciaBoard(),
                listaEquipo.get(i).getRam(),
                listaEquipo.get(i).getDisco(),
                listaEquipo.get(i).getProcesador(),
                listaEquipo.get(i).getMonitor(),
                listaEquipo.get(i).getTeclado(),
                listaEquipo.get(i).getSerialMonitor(),
                listaEquipo.get(i).getSerialTeclado()});
        }
        return modelo;
    }

    public Equipo consultarEquipo(String serial) {
        for (int i = 0; i < listaEquipo.size(); i++) {
            if (listaEquipo.get(i).getSerial().trim().equals(serial)) {
                return listaEquipo.get(i);
            }
        }
        return null;
    }

    public DefaultTableModel consultarListar(String codigo) {
        int encontrado = 0;

        DefaultTableModel modelo = new DefaultTableModel();
        String nombreColumnas[] = {"Serial", "Marca", "MarcaBoard", "ReferenciaBoard", "Ram", "Disco", "Procesador", "Monitor", "Teclado", "SerialMonitor", "SerialTeclado"};
        modelo = new DefaultTableModel(new Object[][]{}, nombreColumnas);
        for (int i = 0; i < listaEquipo.size(); i++) {
            if (listaEquipo.get(i).getSerial().equals(codigo)) {
                modelo.addRow(new Object[]{
                    listaEquipo.get(i).getSerial(),
                    listaEquipo.get(i).getMarca(),
                    listaEquipo.get(i).getMarcaBoard(),
                    listaEquipo.get(i).getReferenciaBoard(),
                    listaEquipo.get(i).getRam(),
                    listaEquipo.get(i).getDisco(),
                    listaEquipo.get(i).getProcesador(),
                    listaEquipo.get(i).getMonitor(),
                    listaEquipo.get(i).getTeclado(),
                    listaEquipo.get(i).getSerialMonitor(),
                    listaEquipo.get(i).getSerialTeclado()});
                break;
            }
        }
        if (encontrado == 0) {
        }
        return modelo;
    }

    public boolean modificarInsumo(String serial, Equipo equipo) {
        for (int i = 0; i < listaEquipo.size(); i++) {
            if (listaEquipo.get(i).getSerial().equals(equipo.getSerial())) {
                listaEquipo.remove(i);
                listaEquipo.add(equipo);
                return true;
            }
        }
        return false;
    }

    public boolean eliminarEquipo(String serial) {
        for (int i = 0; i < listaEquipo.size(); i++) {
            if (listaEquipo.get(i).getSerial().equals(serial)) {
                listaEquipo.remove(i);
                return true;
            }
        }
        return false;
    }
}
