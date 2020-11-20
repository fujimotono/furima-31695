window.addEventListener('load', () => {
  const priceInput = document.getElementById('item-price');
  priceInput.addEventListener("input", () => {
    // priceInputに入力された値を取得する→取得した値を変数にする
    const price = document.getElementById('item-price').value;

    // 貼り付ける場所を取得する　⑤⑥
    const addTaxDom = document.getElementById('add-tax-price');
    const profit = document.getElementById('profit');
   
    // 計算する　⑦⑧
    const Tax = Math.floor(price * 0.1)
    const addProfit = Math.floor(price - Tax);

    // 貼り付ける　⑨⑩
    addTaxDom.innerHTML = Tax;
    profit.innerHTML = addProfit;
  })
  });

// ①　JSを動かす記述　OK
// ②　価格入力欄のID属性を手がかりに入力値をpriceInputに入れる　OK
// ③　上記で入れた変数Aに対しての発火条件を書く　OK
// ④　priceInputの中で入力された値を取得してpriceに入れる　x
// ⑤　手数料を貼り付ける場所を取得し、addTaxDomに入れる
// ⑥　販売利益を貼り付ける場所を取得し、profitに入れる
// ⑦　手数料の計算　Taxに計算結果を入れ込む
// ⑧　販売利益の計算　変数に計算結果を入れ込む
// ⑨　どこになにを貼り付けるか
// ⑩　販売利益の計算　変数に計算結果を入れ込む
