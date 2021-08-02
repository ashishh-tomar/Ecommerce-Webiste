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
            },6000)
        }



//Confirmation mail
function confirm()
{
	localStorage.clear();
    $("#toast").addClass("display");
    $("#toast").html("Your Order is placed please check your mail. Have a Good Day!!!");

    setTimeout(()=>{
        $("#toast").removeClass("display");
    },6000)
}


//CheckOut Page
function goToCheckout(){
	
	window.location="checkout.jsp"
}




//Template Js
(function ($) {
    "use strict";
    
    // Dropdown on mouse hover
    $(document).ready(function () {
        function toggleNavbarMethod() {
            if ($(window).width() > 992) {
                $('.navbar .dropdown').on('mouseover', function () {
                    $('.dropdown-toggle', this).trigger('click');
                }).on('mouseout', function () {
                    $('.dropdown-toggle', this).trigger('click').blur();
                });
            } else {
                $('.navbar .dropdown').off('mouseover').off('mouseout');
            }
        }
        toggleNavbarMethod();
        $(window).resize(toggleNavbarMethod);
    });
    
    
    // Back to top button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });
    $('.back-to-top').click(function () {
        $('html, body').animate({scrollTop: 0}, 1500, 'easeInOutExpo');
        return false;
    });


    // Vendor carousel
    $('.vendor-carousel').owlCarousel({
        loop: true,
        margin: 29,
        nav: false,
        autoplay: true,
        smartSpeed: 1000,
        responsive: {
            0:{
                items:2
            },
            576:{
                items:3
            },
            768:{
                items:4
            },
            992:{
                items:5
            },
            1200:{
                items:6
            }
        }
    });


    // Related carousel
    $('.related-carousel').owlCarousel({
        loop: true,
        margin: 29,
        nav: false,
        autoplay: true,
        smartSpeed: 1000,
        responsive: {
            0:{
                items:1
            },
            576:{
                items:2
            },
            768:{
                items:3
            },
            992:{
                items:4
            }
        }
    });


    // Product Quantity
    $('.quantity button').on('click', function () {
        var button = $(this);
        var oldValue = button.parent().parent().find('input').val();
        if (button.hasClass('btn-plus')) {
            var newVal = parseFloat(oldValue) + 1;
        } else {
            if (oldValue > 0) {
                var newVal = parseFloat(oldValue) - 1;
            } else {
                newVal = 0;
            }
        }
        button.parent().parent().find('input').val(newVal);
    });
    
})(jQuery);

