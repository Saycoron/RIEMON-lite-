var WSContent = function () {
	this.nivelagua = 0
	this.humedad = 0
	this.humedadPlanta = 0
	this.iluminacion = 0
	this.maceta = 0
	this.temp = 0
}
WSContent.prototype.setNivelagua = function (stats) {
	this.nivelagua = stats
}
WSContent.prototype.setHumedad = function (stats) {
	this.humedad = stats
}
WSContent.prototype.setHumedadPlanta = function (stats) {
	this.humedadPlanta = stats
}
WSContent.prototype.setIluminacion = function (stats) {
	this.iluminacion = stats
}
WSContent.prototype.setMaceta = function (stats) {
	this.maceta = stats
}
WSContent.prototype.setTemp = function (stats) {
	this.temp = stats
}

module.exports = WSContent