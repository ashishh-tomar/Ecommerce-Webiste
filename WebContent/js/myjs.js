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
		//console.log("Product is added for the first time")
		showToast("Item Added to Cart")
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
				//console.log("Product Quantity is increase")
				showToast(oldProduct.productName+" Quantity Increased, Quantity : "+oldProduct.productQuantity)
				}
			
			else
				{
				//We have to add product
				let product={ productId:pId,productName:pName,productQuantity:1,productPrice:pPrice}
				pCart.push(product)
				localStorage.setItem("cart",JSON.stringify(pCart));
				console.log("Product is added")
				showToast("Product is Added to Cart")
				}
		}

	update_cart();
}



//Update cart

function update_cart()
{
	let cartString=localStorage.getItem("cart");
	let cart=JSON.parse(cartString);
	if(cart==null ||cart.length==0)
		{
		console.log("Cart is Empty")
		$(".cart-items").html("( 0 )");
		$(".cart-body").html("<h3>Cart does not have any items </h3>");
		$(".checkout-btn").attr('disabled',true);
		}
	else
		{
		console.log(cart)
		$(".cart-items").html(`(${cart.length})`);
		let table=`
			<table class='table'>
			<thead class='thead-light'>
				<tr>
					<th>Item Name </th>
					<th>Price </th>
					<th>Quantity </th>
					<th>Total </th>
					<th>Action </th>
				</tr>
			</thead>
			
		
		
		
		
		`;
		let totalPrice=0;
		cart.map((item)=>{
			table+=`
			<tr>
				<td>${item.productName}</td>
				<td>${item.productPrice}</td>
				<td>${item.productQuantity}</td>
				<td>${item.productQuantity*item.productPrice}</td>
				<td><button onclick="deleteItemFromCart(${item.productId})"  class="btn-danger btn-sm">Remove</button></td>
			</tr>`
				
				totalPrice+=item.productPrice*item.productQuantity;
		})
		
		table=table+`
		
		<tr>
		<td colspan='5' class='text-right font-weight-bold '>
		Totol Price : ${totalPrice}
		</td>
		</tr></table>`
		$(".cart-body").html(table);
		$(".checkout-btn").attr('disabled',false);
		}
}

//delete Item
function deleteItemFromCart(pid)
{
	let cart=JSON.parse(localStorage.getItem("cart"));
	let newCart=cart.filter((item)=>item.productId != pid)
	localStorage.setItem("cart",JSON.stringify(newCart))
	update_cart();
	showToast("Item is Removed from Cart ")
	}

$(document).ready(function (){
	update_cart()
})



//toast 

function showToast(content){
            $("#toast").addClass("display");
            $("#toast").html(content);

            setTimeout(()=>{
                $("#toast").removeClass("display");
            },2000)
        }


//CheckOut Page
function goToCheckout(){
	
	window.location="checkout.jsp"
}