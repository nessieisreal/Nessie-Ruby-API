require 'net/http'
require 'json'
require 'uri'

class CapitalOne

	APIkey = 'CUSTf52dd79967987b3ba94904e83cc26e47'
	baseURL = 'http://api.reimaginebanking.com:80'

		json ='{
	 		 "address": {
	  		   "street_number": "424 Waupelani Drive",
	    	   "street_name": "",
	  		   "city": "state college",
	   		   "state": "PA",
	    	   "zip": "16801"
	  		}
		}'

		acctJson =	'{
			"nickname":"myTest"
		}'

		newAcctJson = '{
		  "type": "",
		  "nickname": "",
		  "rewards": 0,
		  "balance": 0
		}'

		newBillJson = '{
		  "status": "Pending",
		  "payment_amount": 10
		}'

		newTranJson = '{
		  "transaction type": "cash",
		  "payee id": "5517614cc5749d260bb8d160",
		  "amount": 50
		}'

		#GET requests

		def self.getATMS
			url = "http://api.reimaginebanking.com:80/atms?key=#{APIkey}"
			resp = Net::HTTP.get_response(URI.parse(url))
			data = resp.body
		end

		def self.getATM(id)
			url = "http://api.reimaginebanking.com:80/atms/#{id}?key=#{APIkey}"
			resp = Net::HTTP.get_response(URI.parse(url))
			data = resp.body
		end

		def self.getCustomers
			url = "http://api.reimaginebanking.com:80/customers?key=#{APIkey}"
			resp = Net::HTTP.get_response(URI.parse(url))
			data = resp.body
			
		end

		def self.getCustomer(id)
			url = "http://api.reimaginebanking.com:80/customers/#{id}?key=#{APIkey}"
			resp = Net::HTTP.get_response(URI.parse(url))
			data = resp.body
			
		end

		def self.getCustAccts(custID)
			url = "http://api.reimaginebanking.com:80/customers/#{custID}/accounts?key=#{APIkey}"
			resp = Net::HTTP.get_response(URI.parse(url))
			data = resp.body
			
		end
		#getCustAccts('5516c07ba520e0066c9ac53b')

		#get all 
		def self.getBills(custID)
			url = "http://api.reimaginebanking.com:80/customers/#{custID}/bills?key=#{APIkey}"
			resp = Net::HTTP.get_response(URI.parse(url))
			data = resp.body
			
		end

		#cust = 5516c07ba520e0066c9ac53b
		#bill = null
		def self.getCustBill(custID, billID)
			 url = "http://api.reimaginebanking.com:80/customers/#{custID}/bills/#{billID}?key=#{APIkey}"
			 resp = Net::HTTP.get_response(URI.parse(url))
			 data = resp.body
			 
		end

		#Gets all accounts of a given type.
		#Possible arguments are: Savings, Credit Card, or Checking.
		def self.getAllAccounts(type)
			url = "http://api.reimaginebanking.com:80/accounts?type=#{type}&key=#{APIkey}"
			resp = Net::HTTP.get_response(URI.parse(url))
			data = resp.body
			
		end

		def self.getAccById(accID)
			url = "http://api.reimaginebanking.com:80/accounts/#{accID}?key=#{APIkey}"
			resp = Net::HTTP.get_response(URI.parse(url))
			data = resp.body
			
		end
		#Get the customer for the given account.
		def self.getCustForAcc(accID)
			url = "http://api.reimaginebanking.com:80/accounts/#{accID}/customer?key=#{APIkey}"
			resp = Net::HTTP.get_response(URI.parse(url))
			data = resp.body
			
		end
		#Get all bills for a specific account
		def self.getAccBills(accID)
			url = "http://api.reimaginebanking.com:80/accounts/#{accID}/bills?key=#{APIkey}"
			resp = Net::HTTP.get_response(URI.parse(url))
			data = resp.body
		end

		#getAccBills('55173197c5749d260bb8d151')

		#get a specific bill from a specific account
		def self.findAccBill(accID, billID)
			url ="http://api.reimaginebanking.com:80/accounts/#{accID}/bills/#{billID}?key=#{APIkey}"
			resp = Net::HTTP.get_response(URI.parse(url))
			data = resp.body
			
		end
		#Find all transactions associated with an account
		def self.getAccTransactions(accID)
			url = "http://api.reimaginebanking.com:80/accounts/#{accID}/transactions?key=#{APIkey}"
			resp = Net::HTTP.get_response(URI.parse(url))
			data = resp.body
			
		end
		#Find a transaction by id for a specific accoutnt id
		def self.findAccTransaction(accID, tranID)
			url = "http://api.reimaginebanking.com:80/accounts/#{accID}/transactions/#{tranID}?key=#{APIkey}"
			resp = Net::HTTP.get_response(URI.parse(url))
			data = resp.body
			
		end

		#get all branches
		def self.getBranches
			url = "http://api.reimaginebanking.com:80/branches?key=#{APIkey}"
			resp = Net::HTTP.get_response(URI.parse(url))
			data = resp.body
			
		end

		#find branch by id
		def self.findBranch(branchID)
			url = "http://api.reimaginebanking.com:80/branches/#{APIkey}?key=#{APIkey}"
			resp = Net::HTTP.get_response(URI.parse(url))
			data = resp.body
			
		end



		#PUT requests

		#update customer info

		def self.updateCustomer(custID, json)
			url = "http://api.reimaginebanking.com:80/customers/#{custID}?key=#{APIkey}"
			uri = URI.parse(url)
			myHash = JSON.parse(json)
			puts(myHash)
			http = Net::HTTP.new(uri.host, uri.port)
			puts(uri.host)
			puts(uri.port)
			key = "?key=#{APIkey}"
			puts(uri.path+key)
			request = Net::HTTP::Put.new(uri.path+key)
			request.set_form_data(myHash)
			http.request(request)
			puts(http.request(request))
		end

		# updateCustomer('5516c07ba520e0066c9ac53b', json)
		# getCustomer('5516c07ba520e0066c9ac53b')

		#updates an account's nickname by id with given json data. 
		def self.updateAccount(acctID, json)
			url = "http://api.reimaginebanking.com:80/accounts/#{acctID}?key=#{APIkey}"
			uri = URI.parse(url)
			myHash = JSON.parse(json)
			puts(myHash)
			http = Net::HTTP.new(uri.host, uri.port)
			puts(uri.host)
			puts(uri.port)
			key = "?key=#{APIkey}"
			puts(uri.path+key)
			request = Net::HTTP::Put.new(uri.path+key)
			request.set_form_data(myHash)
			http.request(request)
			puts(http.request(request))
		end


		#updateAccount('55173197c5749d260bb8d151', acctJson)

		#POST requests

		#creates a new account
		def self.createAcct(custID, json)
			url = "http://api.reimaginebanking.com:80/customers/#{custID}/accounts?key=#{APIkey}"
			uri = URI.parse(url)
			http = Net::HTTP.new(uri.host, uri.port)
			puts(uri.host)
			puts(uri.port)
			key = "?key=#{APIkey}"
			puts(uri.path+key)
			myHash = JSON.parse(json)
			puts(myHash)
			puts(Net::HTTP.post_form(uri, myHash))
		#	getCustAccts('5516c07ba520e0066c9ac53b')
		end
		#getCustAccts("5516c07ba520e0066c9ac53b")

		#createAcct('5516c07ba520e0066c9ac53b', newAcctJson)

		#create a new bill on an associated account ID
		# def self.createBill(acctID, json)
		# 	url = "http://api.reimaginebanking.com:80/accounts/#{acctID}/bills?key=#{APIkey}"
		# 	uri = URI.parse(url)
		# 	http = Net::HTTP.new(uri.host, uri.port)
		# 	puts(uri.host)
		# 	puts(uri.port)
		# 	key = "?key=#{APIkey}"
		# 	puts(uri.path+key)
		# 	myHash = JSON.parse(json)
		# 	puts(myHash)
		# 	puts(Net::HTTP.post_form(uri, myHash))
		# 	puts(getAccBills('55173197c5749d260bb8d151'))
		# end
		# createBill("55173197c5749d260bb8d151", newBillJson)

		#create a new transaction between 2 accounts
		def self.createTransaction(toAcc, json)
			url = "http://api.reimaginebanking.com:80/accounts/#{toAcc}/transactions?key=#{APIkey}"
			uri = URI.parse(url)
			http = Net::HTTP.new(uri.host, uri.port)
			puts(uri.host)
			puts(uri.port)
			key = "?key=#{APIkey}"
			puts(uri.path+key)
			myHash = JSON.parse(json)
			puts(myHash)
			Net::HTTP.post_form(uri, myHash)
			getAccTransactions('55175197c5749d260bb8d159')
		end
		#createTransaction('5516c07ba520e0066c9ac53b', newTranJson)


		#DELETE requests

		#delete a bill by id from a given account
		def self.deleteBill(accID, billID)
			url = "http://api.reimaginebanking.com:80/accounts/#{accID}/bills/#{billID}?key=#{APIkey}"
			uri = URI.parse(url)
			http = Net::HTTP.new(uri.host, uri.port)
			key="?key=#{APIkey}"
			request = Net::HTTP::Delete.new(uri.path+key)
			http.request(request)
			puts('in del bill')
			puts(http.request(request))
		end

		#deleteBill('546cd56d04783a02616859c9', '546cd56d04783a02616859c9')

		#delete a given account with some ID
		def self.deleteAcc(accID)
			url = "http://api.reimaginebanking.com:80/accounts/#{accID}?key=#{APIkey}"
			uri = URI.parse(url)
			http = Net::HTTP.new(uri.host, uri.port)
			key="?key=#{APIkey}"
			request = Net::HTTP::Delete.new(uri.path+key)
			http.request(request)
			puts('in del acc')
			puts(http.request(request))
		end

		#deleteAcc('546cd56d04783a02616859c9')

		def self.deleteTransaction(accID, transID)
			url = "http://api.reimaginebanking.com:80/accounts/#{accID}/transactions/#{transID}?key=#{APIkey}"
			uri = URI.parse(url)
			http = Net::HTTP.new(uri.host, uri.port)
			key="?key=#{APIkey}"
			request = Net::HTTP::Delete.new(uri.path+key)
			http.request(request)
			puts('in del transaction')
			puts(http.request(request))
		end
		#deleteTransaction('546cd56d04783a02616859c9', '546cd56d04783a02616859c9')


		def self.setAPIKey(key)
		#	APIkey = key
		end

		def self.getAPIKey
			return APIkey
		end
	end

