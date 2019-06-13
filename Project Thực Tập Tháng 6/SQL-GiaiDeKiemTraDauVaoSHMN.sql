
  -- Câu 1
  select C.CustomerID, C.CompanyName
  from Customers as C
  inner join Orders as O on C.CustomerID = O.CustomerID  
  where O.CustomerID='ALFKI'

   select C.CustomerID, C.CompanyName, E.FirstName,P.ProductName, year(O.OrderDate) as SYear,D.Quantity, D.UnitPrice*D.Quantity-D.Discount as TotalAmount
   from Orders as O 
   inner join Customers as C		on O.CustomerID = C.CustomerID
   inner join Employees as E		on O.EmployeeID = E.EmployeeID
   inner join [Order Details] as D	on O.OrderID = D.OrderID    
   inner join Products as P			on P.ProductID = D.ProductID 
   inner join Suppliers as S		on P.SupplierID = S.SupplierID
   where (Year(O.OrderDate) between 1997 and 1998) and C.CustomerID='ALFKI'
   order by SYear, FirstName, ProductName


-- Câu 2
   select top 3  E.FirstName, str(sum(D.UnitPrice*D.Quantity-D.Discount),10,2) as TotalAmount
   from Orders as O
   inner join Employees as E		on O.EmployeeID = E.EmployeeID
   inner join [Order Details] as D	on O.OrderID	= D.OrderID   
   where YEAR( O.OrderDate) = '1998'
   group by E.FirstName
   order by TotalAmount desc

   go
   create proc Select_Product
	@Id int 
	as
	begin
		select * from Products
		where ProductID=@Id

	end

	exec Select_Product 1

   