function add_to_cart(pId,pName,pPrice)
{
	let cart=localStorage.getItem("cart");
	if(cart==null)
		{
			//no cart yet
		let products=[];
		let product={ productId:pId,productName:pName,productQuantity:1,productPrice:pPrice}
		products.push(product);
		localStorage.setItem("cart",JSON.stringify(products));
		console.log("Product is added for the first time")
		}
	else
		{
			//cart is already present
			let pCart=JSON.parse(cart);
			let oldProduct=pCart.find((item)=>item.productId==pId)
			if(oldProduct)
				{
				//We have to increase quantity
				oldProduct.productQuantity=oldProduct.productQuantity+1
				pCart.map((item)=>{
					
					if(item.productId==oldProduct.productId)
						{
						item.productQuantity=oldProduct.productQuantity;
						}
				})
				localStorage.setItem("cart",JSON.stringify(pCart));
				console.log("Product Quantity is increase")
				}
			else
				{
				//We have to add product
				let product={ productId:pId,productName:pName,productQuantity:1,productPrice:pPrice}
				pCart.push(product)
				localStorage.setItem("cart",JSON.stringify(pCart));
				console.log("Product is added")
				}
		}
}