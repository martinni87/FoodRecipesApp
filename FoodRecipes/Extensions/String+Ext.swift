//
//  String+Ext.swift
//  FoodRecipes
//
//  Created by Martín Antonio Córdoba Getar on 17/12/24.
//

import Foundation

extension String {
    func extractSubstring(start: Int = 0, length: Int) -> String {
        // Si start es negativo, se asigna 0 por defecto
        let validStart = max(start, 0)
        
        // Aseguramos que length sea positivo
        let validLength = max(length, 0)
        
        // Calculamos el índice inicial seguro
        let startIndex = self.index(self.startIndex, offsetBy: validStart, limitedBy: self.endIndex) ?? self.endIndex
        
        // Calculamos la longitud máxima que se puede tomar sin exceder el límite
        let remainingLength = self.distance(from: startIndex, to: self.endIndex)
        let adjustedLength = min(validLength, remainingLength)
        
        // Calculamos el índice final seguro
        let endIndex = self.index(startIndex, offsetBy: adjustedLength, limitedBy: self.endIndex) ?? self.endIndex
        
        return String(self[startIndex..<endIndex])
    }
}
