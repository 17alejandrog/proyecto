/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.util.ArrayList;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
import Modelo.Software;

/**
 *
 * @author user
 */
public class CtlSoftware {
    static ArrayList<Software> listaSof = new ArrayList<Software>();

    public boolean registrarSoftware(String nombre, String tipo) {
        int band = 0;
       Software software = new Software(nombre, tipo);
        if (listaSof.isEmpty()) {
            listaSof.add(software);
            return true;
        } else {
            for (int i = 0; i < listaSof.size(); i++) {
                if ((software.getTipo()).equals(listaSof.get(i).getTipo())){
                    band = 1;
                }

            }
            if (band == 0) {
                listaSof.add(software);
                return true;
            } else {
                JOptionPane.showMessageDialog(null, "Ya se encuentra registrado");
            }
        }
        return false;
    }
     public DefaultTableModel listar() {
        DefaultTableModel modelo = new DefaultTableModel();
        String nombreColumnas[] = {"Nombre", "Tipo"};
        modelo = new DefaultTableModel(new Object[][]{}, nombreColumnas);
        for (int i = 0; i < listaSof.size(); i++) {
            modelo.addRow(new Object[]{
                listaSof.get(i).getNombre(),
                listaSof.get(i).getTipo()});
        }
        return modelo;
    }
     public Software consultarSoftware(String tipo) {
        for (int i = 0; i < listaSof.size(); i++) {
            if (listaSof.get(i).getTipo().trim().equals(tipo)) {
                return listaSof.get(i);
            }
        }
        return null;
    }

    public DefaultTableModel consultarSoftwareModelo(String tipo) {
        int encontrado = 0;
        Software software;
        DefaultTableModel modelo = new DefaultTableModel();
        String nombreColumnas[] = {"Nombre", "Tipo"};
        modelo = new DefaultTableModel(new Object[][]{}, nombreColumnas);
        for (int i = 0; i < listaSof.size(); i++) {
            if (listaSof.get(i).getTipo().equals(tipo)) {
                modelo.addRow(new Object[]{
                    listaSof.get(i).getNombre(),
                    listaSof.get(i).getTipo()});
                break;
            }
        }
        if (encontrado == 0) {
        }
        return modelo;
    }

    public boolean modificarSoftware(String tipo, Software software) {
        for (int i = 0; i < listaSof.size(); i++) {
            if (listaSof.get(i).getTipo().equals(software.getTipo())) {
                listaSof.remove(i);
                listaSof.add(software);
                return true;
            }
        }
        return false;
    }

    public boolean eliminarSoftware(String tipo) {
        for (int i = 0; i < listaSof.size(); i++) {
            if (listaSof.get(i).getTipo().equals(tipo)) {
                listaSof.remove(i);
                return true;
            }
        }
        return false;
    }

}
