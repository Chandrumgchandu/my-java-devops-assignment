package com.example;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class CalculatorTest {

    private final Calculator calculator = new Calculator();

    @Test
    void testAddition() {
        assertEquals(10.0, calculator.add(6, 4));
    }

    @Test
    void testSubtraction() {
        assertEquals(1.0, calculator.subtract(6, 4));
    }

    @Test
    void testMultiplication() {
        assertEquals(24.0, calculator.multiply(6, 4));
    }

    @Test
    void testDivision() {
        assertEquals(3.0, calculator.divide(12, 4));
    }

    @Test
    void testDivisionByZero() {
        assertThrows(
            IllegalArgumentException.class,
            () -> calculator.divide(10, 0)
        );
    }
}