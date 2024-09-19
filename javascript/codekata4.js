function getCopyright(name,year = 2024){
    let copyright = name + " - " + year
    return copyright
}

let result = getCopyright("Rafa")
console.log(result)

let result3 = function getCopyright(name,year,formatter){
    let copyright = formatter(name,year)
    return copyright
}

let formatter = function(name,year){
    return name + "  |  " + year
}

console.log(result3("Mbappe",2023,formatter))

(function(name, year) {
    console.log(name, year);
})("AAA", 2022);


