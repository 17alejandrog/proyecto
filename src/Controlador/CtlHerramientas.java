/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.util.ArrayList;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
import Modelo.Herramientas;

/**
 *
 * @author user
 */
public class CtlHerramientas {
    
     static ArrayList<Herramientas> listaHerramienta = new ArrayList<Herramientas>();

    public boolean registrarHerramienta(String nombre, String codigo, int cantidad) {
        int band = 0;
        Herramientas herramientas= new Herramientas(nombre, codigo, cantidad);
        if (listaHerramienta.isEmpty()) {
            listaHerramienta.add(herramientas);
            return true;
        } else {
            for (int i = 0; i < listaHerramienta.size(); i++) {
                if ((herramientas.getCodigo().equals(listaHerramienta.get(i).getCodigo()))) {
                    band = 1;
                }

            }
            if (band == 0) {
                listaHerramienta.add(herramientas);
                return true;
            } else {
                JOptionPane.showMessageDialog(null, "Ya se encuentra registrado");
            }
        }
        return false;
    }

    public DefaultTableModel listar() {
        DefaultTableModel modelo = new DefaultTableModel();
        String nombreColumnas[] = {"Nombre", "Código", "Cantidad"};
        modelo = new DefaultTableModel(new Object[][]{}, nombreColumnas);
        for (int i = 0; i < listaHerramienta.size(); i++) {
            modelo.addRow(new Object[]{
                listaHerramienta.get(i).getNombre(),
                listaHerramienta.get(i).getCodigo(),
                listaHerramienta.get(i).getCantidad()});
        }
        return modelo;
    }

    public Herramientas consultarHer(String codigo) {
        for (int i = 0; i < listaHerramienta.size(); i++) {
            if (listaHerramienta.get(i).getCodigo().trim().equals(codigo)) {
                return listaHerramienta.get(i);
            }
        }
        return null;
    }

    public DefaultTableModel consultarModelo(String codigo) {
        int encontrado = 0;
      
        DefaultTableModel modelo = new DefaultTableModel();
        String nombreColumnas[] = {"Nombre", "Código", "Cantidad"};
        modelo = new DefaultTableModel(new Object[][]{}, nombreColumnas);
        for (int i = 0; i < listaHerramienta.size(); i++) {
            if (listaHerramienta.get(i).getCodigo().equals(codigo)) {
                modelo.addRow(new Object[]{
                    listaHerramienta.get(i).getNombre(),
                    listaHerramienta.get(i).getCodigo(),
                    listaHerramienta.get(i).getCantidad()});
                break;
            }
        }
        if (encontrado == 0) {
        }
        return modelo;
    }

    public boolean modificarHerramienta(String codigo, Herramientas herramientas) {
        for (int i = 0; i < listaHerramienta.size(); i++) {
            if (listaHerramienta.get(i).getCodigo().equals(herramientas.getCodigo())) {
                listaHerramienta.remove(i);
                listaHerramienta.add(herramientas);
                return true;
            }
        }
        return false;
    }

    public boolean eliminarHerramienta(String codigo) {
        for (int i = 0; i < listaHerramienta.size(); i++) {
            if (listaHerramienta.get(i).getCodigo().equals(codigo)) {
                listaHerramienta.remove(i);
                return true;
            }
        }
        return false;
    }
}
