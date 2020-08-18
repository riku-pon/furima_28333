  // {}の中は、イベントclick(マウスのボタンを一度押して話した時)で発火した際の処理
addEventListener('click', function() {
  // id item-priceのHTML要素を、変数consumptionTaxに代入している
  const consumptionTax = document.getElementById("item-price")
  // id add-tax-priceのHTML要素を、変数feeに代入している
  const fee = document.getElementById('add-tax-price')
  // id profitのHTML要素を、変数salesProfitに代入している
  const salesProfit = document.getElementById('profit')

  // 変数consumptionTaxがイベントinput(要素に値が入力された時)で発火した際の処理
  consumptionTax.addEventListener('input', function(){
    // 消費税の計算式を変数priceに代入
    const price = consumptionTax.value * 0.1
    // 変数feeをMath.floor(price)で小数点切り捨てとし、.toLocaleString()でカンマを付けて.innerHTMLで置き換えている
    fee.innerHTML = Math.floor(price).toLocaleString()
    // consumptionTax(価格)から.valueで値のみ取得し、price(消費税)を引いてprofitに代入している
    const profit = consumptionTax.value - price
    // 変数salesProfitをMath.floor(price)で小数点切り捨てとし、.toLocaleString()でカンマを付けて.innerHTMLで置き換えている
    salesProfit.innerHTML = Math.floor(profit).toLocaleString()
  })
})

