/**
 * Generic State class.
 * 
 * When instantiated the type should be specified: `var myState = new State<String>();`
 */
@:generic
class State<T> {
	/**
	 * This state's id.
	 */
	public var id(default, null):T;

	/**
	 * This state's name.
	 */
	public var name:String;

	public function new(_id:T, _name:String = "") {
		id = _id;
		name = _name;
	}

	/**
	 * Function called when the state is entered.
	 */
	public function enter() {}

	/**
	 * Function called when the state is exited.
	 */
	public function exit() {}

	public function update() {}

	public function fixedUpdate() {}
}
