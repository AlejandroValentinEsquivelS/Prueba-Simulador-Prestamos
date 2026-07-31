const montoSolicitado = document.getElementById("montoSolicitado");
const plazoCredito = document.getElementById("plazoCredito");
const calcularBtn = document.getElementById("calcularBtn");
const resultado = document.getElementById("resultado");

calcularBtn.addEventListener("click", () => {

    const monto = parseFloat(montoSolicitado.value);
    const plazo = parseInt(plazoCredito.value);

    if (isNaN(monto) || monto <= 0) {
        resultado.style.color = "red";
        resultado.textContent = "Ingrese un monto valido";
        return;
    }

    const montoTotal = monto * 1.10;
    const pagoMensual = montoTotal / plazo;

    resultado.style.color = "green";
    resultado.innerHTML = `
        <strong>Monto total:</strong> $${montoTotal.toFixed(2)}<br>
        <strong>Plazo:</strong> ${plazo} meses<br>
        <strong>Pago mensual:</strong> $${pagoMensual.toFixed(2)}
    `;
});