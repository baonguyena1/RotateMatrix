//: Playground - noun: a place where people can play

import UIKit

// Implement two dimensional array with One-dimensional array
public struct Matrix {
    
    public init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        values = [Double](repeating: 0.0, count: rows * columns)
    }
    
    // Make subscript for access to element in matrix
    public subscript(row: Int, column: Int) -> Double {
        get {
            return values[(row * columns) + column]
        }
        set {
            values[(row * columns) + column] = newValue
        }
    }
    
    // MARK: Private
    fileprivate let rows: Int, columns: Int
    fileprivate var values: [Double]
}

extension Matrix {
    mutating func fill() {
        for i in (0..<rows * columns) {
            values[i] = Double(i)
        }
    }
}

extension Matrix {
    mutating func rotate90() {
        let layers = rows/2
        for layer in 0..<layers {
            
            let first = layer
            let last  = rows - 1 - layer
            
            for i in first..<last {
                
                // Using tuple for get index of matrix
                let top      = (first, i)
                let left     = (last - (i - first), first)
                let bottom   = (last, last - (i - first))
                let right    = (i, last)
                
                // Change value in matrix by subscript function
                let temp     = self[top]
                
                self[top]    = self[left]
                self[left]   = self[bottom]
                self[bottom] = self[right]
                self[right]  = temp
            }
        }
    }
}

extension Matrix {
    // Print out matrix after rotate
    func printOut() {
        for i in 0..<rows {
            for j in 0..<columns {
                print(self[i,j], separator: "", terminator: " ")
            }
            print()
        }
    }
}

let rows = 5
var matrix = Matrix(rows: rows, columns: rows)
matrix.fill()
matrix.printOut()
print("\n\n")

matrix.rotate90()
matrix.printOut()









