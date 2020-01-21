# flutter_sharedpreferences

This project is a demo on how to use SharedPreferences in Flutter app.

## Steps

### Step 1. Add dependency in pubspec.yaml file in under the dependencies: section. 

```yaml
  #The following adds the SharedPrefenece dependency to your application
   
   shared_preferences: ^0.5.6
```
   
### Step 2. Implement code as it is used in the main.dart file's FlatButton's onpressed: method.

```dart
          FlatButton(
          child: Text(
            "Proceed",
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.lightBlue,
          onPressed: () async {
            //check whether this is the first use or not.
            bool visitingFlag = await getVisitingFlag();
            if(visitingFlag == true)
            {
              //User has already visited this app. so this not the firt time.
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomeScreen()));
            }
            else{
              //user has not opened this app, so redirect user to welcome screen.
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> WelcomeScreen()));
              //set that user has visited app now.
              setVisitingFlage();
            }
          },
        ),
	
```
	
Following example functions are accessed in FlatButton's onpressed function. 

```dart
	setVisitingFlage() async{
    		SharedPreferences preferences = await SharedPreferences.getInstance();
    		preferences.setBool("alreadyVisited", true);
    	}
    	
	getVisitingFlag() async{
    		SharedPreferences preferences = await SharedPreferences.getInstance();
     		/** if there is no data saved with the provieded key, the sharedpreference will return null.
      		*  in this case, we can check whether null can be asigned to the variable or not. We can use null aware operator ??
      		* to assign another value to our variable.
     		*/
     		bool alreadyVisited  = preferences.getBool("alreadyVisited") ?? false;
     		return alreadyVisited;
    	}
```
Remember that SharedPreferneces needs <i>async await</i> operation to work.
### Step 3. Run the code.

