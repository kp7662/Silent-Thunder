#include <stdio.h>
#include <ctype.h>

/* Define global variables */
int lineNum = 1;
int commentStartLine = 0;

/* Define constants representing each state in the DFA. */
enum Statetype {START, MAYBE_COMMENT, IN_COMMENT, END_COMMENT, 
STRING_LITERAL, CHAR_LITERAL, STRING_ESCAPE, CHAR_ESCAPE};

/* Implement the START state of the DFA. c is the current DFA character. 
Write c to stdout, as specified by the DFA. Update global variables when 
read newline character. Return the next state. */
enum Statetype
handleStartState (int c)
{
    enum Statetype state;
    if (c == '/') state = MAYBE_COMMENT;
    else if (c == '\"') {
        putchar(c);
        state = STRING_LITERAL;
    }
    else if (c == '\'') {
        putchar(c);
        state = CHAR_LITERAL;
    }
    else if (c == '\n') {
        putchar(c);
        lineNum++;
        state = START;
    }
    else { 
        putchar(c); 
        state = START;
    }
    return state;
}

/* Implement the MAYBE_COMMENT state of the DFA. c is the current DFA character. 
Write c to stdout, as specified by the DFA. Update global variables when 
read newline character. Return the next state. */
enum Statetype
handleMaybeCommentState (int c)
{
    enum Statetype state;
    if (c == '*') { 
        putchar(' ');
        commentStartLine = lineNum;
        state = IN_COMMENT;
    }
    else if (c == '/') {
        putchar(c);
        state = MAYBE_COMMENT;
    }
    else if (c == '\"') {
        putchar('/');
        putchar(c);
        state = STRING_LITERAL;
    }
    else if (c == '\'') {
        putchar('/');
        putchar(c);
        state = CHAR_LITERAL;
    }
        else if (c == '\n') {
        putchar('/');
        putchar(c);
        lineNum++;
        state = START;
    }
    else {
        putchar('/');
        putchar(c);
        state = START;
    }
    return state;
}

/* Implement the IN_COMMENT state of the DFA. c is the current DFA character. 
Write c to stdout, as specified by the DFA. Update global variables when 
read newline character. Return the next state. */
enum Statetype
handleInCommentState (int c)
{
    enum Statetype state;
    if (c == '*') state = END_COMMENT;
    else if (c == '\n') {
        putchar(c);
        lineNum++;
        state = IN_COMMENT;
    }
    else state = IN_COMMENT;
    return state;
}

/* Implement the END_COMMENT state of the DFA. c is the current DFA character. 
Write c to stdout, as specified by the DFA. Update global variables when 
read newline character. Return the next state. */
enum Statetype
handleEndCommentState (int c)
{
    enum Statetype state;
    if (c == '/') state = START;
    else if (c == '*') state = END_COMMENT;
    else if (c == '\n') {
        putchar(c);
        lineNum++;
        state = IN_COMMENT;
    }
    else state = IN_COMMENT;
    return state;
}

/* Implement the STRING_LITERAL state of the DFA. c is the current DFA character. 
Write c to stdout, as specified by the DFA. Update global variables when 
read newline character. Return the next state. */
enum Statetype
handleStringLiteralState (int c)
{
    enum Statetype state;
    if (c == '\"') {
        putchar(c);
        state = START;
    }
    else if (c == '\\') state = STRING_ESCAPE;
    else if (c == '\n') {
        putchar(c);
        lineNum++;
        state = STRING_LITERAL;
    }
    else {
        putchar(c);
        state = STRING_LITERAL;
    }
    return state;
}

/* Implement the STRING_ESCAPE state of the DFA. c is the current DFA character. 
Write c to stdout, as specified by the DFA. Update global variables when 
read newline character. Return the next state. */
enum Statetype
handleStringEscapeState (int c)
{
    enum Statetype state;
    if (c == '\n') {
        putchar(c);
        lineNum++;
        state = STRING_ESCAPE;
    }
    else {
        putchar('\\');
        putchar(c);
        state = STRING_LITERAL;
    }
    return state;
}

/* Implement the CHAR_LITERAL state of the DFA. c is the current DFA character. 
Write c to stdout, as specified by the DFA. Update global variables when 
read newline character. Return the next state. */
enum Statetype
handleCharLiteralState (int c)
{
    enum Statetype state;
    if (c == '\'') {
        putchar(c);
        state = START;
    }
    else if (c == '\\') state = CHAR_ESCAPE;
    else if (c == '\n') {
        putchar(c);
        lineNum++;
        state = CHAR_LITERAL;
    }
    else {
        putchar(c);
        state = CHAR_LITERAL;
    }
    return state;
}

/* Implement the CHAR_ESCAPE state of the DFA. c is the current DFA character. 
Write c to stdout, as specified by the DFA. Update global variables when 
read newline character. Return the next state. */
enum Statetype
handleCharEscapeState (int c)
{
    enum Statetype state;
    if (c == '\n') {
        putchar(c);
        lineNum++;
        state = CHAR_ESCAPE;
    }
    else {
        putchar('\\');
        putchar(c);
        state = CHAR_LITERAL;
    }
    return state;
}

/* Read character c from stdin. Use a DFA approach. state indicates the DFA state. 
For unterminated comment, print error message to standard error stream (with line 
number on which the unterminated comment begins) and return 1. Otherwise, return 0.*/
int main (void)
{
    int c;
    enum Statetype state = START;
    while ((c = getchar()) != EOF) {
        switch(state) {
            case START:
                state = handleStartState(c);
                break;
            case MAYBE_COMMENT:
                state = handleMaybeCommentState(c);
                break;
            case IN_COMMENT:
                state = handleInCommentState(c);
                break;
            case END_COMMENT:
                state = handleEndCommentState(c);
                break;
            case STRING_LITERAL:
                state = handleStringLiteralState(c);
                break;
            case STRING_ESCAPE:
                state = handleStringEscapeState(c);
                break;
            case CHAR_LITERAL:
                state = handleCharLiteralState(c);
                break;
            case CHAR_ESCAPE:
                state = handleCharEscapeState(c);
                break;
        }
    }
    if (state == MAYBE_COMMENT) {
        putchar('/');
        return 0;
    }
    else if (state == STRING_ESCAPE) {
        putchar('\\');
        return 0;
    }
    else if (state == CHAR_ESCAPE) {
        putchar('\\');
        return 0;
    }
    else if (state == IN_COMMENT || state == END_COMMENT) {
        fprintf(stderr, "Error: line %d: unterminated comment\n", commentStartLine);
        return 1;
    }
    else return 0;
}