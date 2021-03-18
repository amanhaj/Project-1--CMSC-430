// Compiler Theory and Design
// This file contains the function prototypes for the functions that produce the // compilation listing
/**
 * File: listing.h
 * Author: Amanda Hajati
 * Project: Project 1
 * Date: March 29, 2020
 * Description: declares type of enumerated errors and calls the methods from listing.cc
 */

enum ErrorCategories {LEXICAL, SYNTAX, GENERAL_SEMANTIC, DUPLICATE_IDENTIFIER,
	UNDECLARED};

void firstLine();
void nextLine();
int lastLine();
void appendError(ErrorCategories errorCategory, string message);

