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

    public boolean registrarSoftware(String codigo, String nombre, String tipo) {
        int band = 0;
        Software software = new Software(codigo, nombre, tipo);
        if (listaSof.isEmpty()) {
            listaSof.add(software);
            return true;
        } else {
            for (int i = 0; i < listaSof.size(); i++) {
                if ((software.getTipo()).equals(listaSof.get(i).getTipo())) {
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

    public Software consultarSoftware(String codigo) {
        for (int i = 0; i < listaSof.size(); i++) {
            if (listaSof.get(i).getCodigo().trim().equals(codigo)) {
                return listaSof.get(i);
            }
        }
        return null;
    }

    public DefaultTableModel consultarSoftwareModelo() {
       
        Software software;
        DefaultTableModel modelo = new DefaultTableModel();
        String nombreColumnas[] = {"Codigo","Nombre", "Tipo"};
        modelo = new DefaultTableModel(new Object[][]{}, nombreColumnas);
        for (int i = 0; i < listaSof.size(); i++) {
           
                modelo.addRow(new Object[]{
                    listaSof.get(i).getCodigo(),
                    listaSof.get(i).getNombre(),
                    listaSof.get(i).getTipo()});
                
            
        }
        
        return modelo;
    }

    public boolean modificarSoftware(String codigo, Software software) {
        if (consultarSoftware(codigo) != null) {
            Software viejo = consultarSoftware(codigo);
            viejo.setNombre(software.getNombre());
            viejo.setTipo(software.getTipo());
            return true;
        } else {
            return false;
        }

    }

    public boolean eliminarSoftware(String codigo) {
        if (consultarSoftware(codigo) != null) {
            listaSof.remove(consultarSoftware(codigo));
            return true;
        } else {
            return false;
        }

    }

}
