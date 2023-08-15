# TEST EXPRESION

# Las test expresions son comandos que nos permiten evaluar contenido y valores. Es parecido a lo que podría considerarse un if. La sintáxis es como la siguiente estando entre corchetes la evaluación que queremos ver.

# evaluacion
[ hello = hello ]
# alojamiento de evaluacion (0 || 1); siendo (0 === true); (1 === false). Hay que tomar en cuenta que $? va a almacenar el valor de la última evaluación que se haya ejecutado.
echo la evaluación es $?

EQUAL_CERO=0
EQUAL_ONE=0

[ 0 = 0 ]
EQUAL_CERO=$?

[ 0 = 1 ]
EQUAL_ONE=$?

echo primera evaluación $EQUAL_CERO
echo segunda evaluación $EQUAL_ONE

# También hay que saber que hay otras formas de evualuar como -eq -gt -lt -egt etc... siendo estos otros comprobtantes que podemos usar para evaluar valores númericos.

[ 1 -eq 1 ]
echo la evaluación tiene código $?