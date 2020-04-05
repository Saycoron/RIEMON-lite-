var SistemaDeRiego = function () {
	this.nivelAguaValor = '0'
	this.claridadValor = '0'
	this.humedadPlanta1 = '0'
	this.humedadPlanta2 = '0'
	this.humedadPlanta3 = '0'
	this.humedadAmbiente = '0'
	this.tempAmbiente = '0'
}

SistemaDeRiego.prototype.setNiveAguaValor = function (stats) {
	this.nivelAguaValor = stats
}

SistemaDeRiego.prototype.setClaridadValor = function (stats) {
	this.claridadValor = stats
}

SistemaDeRiego.prototype.setHumedadPlanta1 = function (stats) {
	this.humedadPlanta1 = stats
}

SistemaDeRiego.prototype.setHumedadPlanta2 = function (stats) {
	this.humedadPlanta2 = stats
}

SistemaDeRiego.prototype.setHumedadPlanta3 = function (stats) {
	this.humedadPlanta3 = stats
}

SistemaDeRiego.prototype.setHumedadAmbiente = function (stats) {
	this.humedadAmbiente = stats
}

SistemaDeRiego.prototype.setTempAmbiente = function (stats) {
	this.tempAmbiente = stats
}

module.exports = SistemaDeRiego