.section .text, "x"
.global uml_64to128

uml_64to128:
    STMFD sp!,{r4,r5,fp,lr}
    LDR fp,[sp,#16]
    UMULL r4,r5,r0,r2
    UMULL r12,lr,r0,r3
    UMULL r3,r0,r1,r3
    ADDS r5,r5,r12
    ADCS r12,lr,r3
    ADC lr,r0,#0
    UMULL r2,r0,r1,r2
    ADDS r5,r5,r2
    ADCS r12,r12,r0
    ADC lr,lr,#0

    MOV r0,r4
    MOV r1,r5
    MOV r2,r12
    MOV r3,lr

    STR r0, [fp]
    STR r1, [fp, #4]
    STR r2, [fp, #8]
    STR r3, [fp, #12]
    LDMFD sp!,{r4,r5,fp,pc}