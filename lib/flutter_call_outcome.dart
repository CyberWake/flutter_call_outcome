/// flutter_call_outcome package
library flutter_call_outcome;

/// CallOutcome<T> Class.
///
/// This class holds the two possible outcomes of a function call an `exception` and
/// a successful `data` response to be returned to the calling function.
///
/// The object of CallOutcome can be type casted with <T> make data field
/// strongly coupled to store data of particular type only.
///
/// Both `data` and `exception` cannot be `null` at the same object.
class CallOutcome<T> {
  /// Constructor of the class which accepts two arguments `data` and `exception`
  /// Please it is compulsory to provide at least one of the two argument.
  /// Else an assertion is made resulting in compilation error.
  CallOutcome({this.data, this.exception})
      :

        /// Checking if both the member fields are not initialised with null
        assert(
          data != null || exception != null,
          "Both data and exception can't be empty",
        );

  /// `data` member of the class is a general purpose member with datatype
  /// <T> supplied while the creation of the object of class CallOutcome
  /// If non is passed then it can store any value as it happens to be of `dynamic`
  /// type in this case
  ///
  /// To define the specific type of the member `data` try using:
  ///
  /// `CallOutcome<String> outcome = await function(); //Where definition of function is also like`
  ///
  /// Future<CallOutcome<String>> function()async{
  /// ```dart
  ///   try{
  ///     //make your network or db calls here
  ///     //check if the response returned was successful or not
  ///     ...
  ///     ...
  ///     if(response.statusCode == 200){
  ///       return CallOutcome<String>(data:"Some String");
  ///     }else{
  ///       return CallOutcome<String>(exception: Exception(response.statusCode.toString()));
  ///     }
  ///   }on Exception catch(e){
  ///     ...
  ///     return CallOutcome<String>(exception: e);
  ///   }
  /// }
  /// ```
  T? data;

  /// `exception` member takes in a value of type `Exception`. If you have your
  /// own exception of string format to be passed it this way to return it:
  ///
  /// `return CallOutcome<String>(exception: Exception(e));`
  ///
  Exception? exception;
}
