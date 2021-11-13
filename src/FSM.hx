/**
 * Finite State Machine class.
 * 
 * A FSM
 * - consists of a collection of states
 * - can only exist in one state at any given time
 */
class FSM {
	/**
	 * Map/Dictionary representing the collection of possible states.
	 */
	var states:Map<Any, State<Any>>;

	/**
	 * Current state the FSM is in.
	 */
	var currentState(default, null):State<Any>;

	public function new() {
		states = new Map<Any, State<Any>>();
	}

	/**
	 * Adds `_state` to the collection of `states`, setting the key for this state to the value of `_state.id`
	 * @param _state the state to add to the `states` dictionary
	 */
	public function addState(_state:State<Any>) {
		states.set(_state.id, _state);
	}

	/**
	 * Adds _state to the collection of `states`, setting the key for this state to the value of `_id`
	 * @param _id the key this state will be identified with inside the `states` Dictionary
	 * @param _state the state to add to the `states` dictionary
	 */
	public function addStateWithId(_id:Any, _state:State<Any>) {
		states.set(_id, _state);
	}

	/**
	 * Returns a state based on a key.
	 * @param _stateID the key associated to the state we want to get
	 * @return the state associated to the key `_stateID`, if present in the collection (otherwise `null`) 
	 */
	public function getState(_stateID:Any):State<Any> {
		if (states.exists(_stateID)) {
			return states[_stateID];
		}
		return null;
	}

	/**
	 * Setter function for `currentState`.
	 * 
	 * Checks if `currentState` is null, if so the FSM directly switches to `_newCurrentState`, 
	 * otherwise it transitions from the previous state to `_newCurrentState`.
	 * @param _newCurrentState the new state we want the FSM to assume
	 */
	function setCurrentState(_newCurrentState) {
		if (currentState == _newCurrentState)
			return;

		if (currentState != null) // if we currently are in a state
			currentState.exit(); // exit from it

		currentState = _newCurrentState; // switch current state

		if (currentState != null) // if the new state is a state
			currentState.enter(); // enter it
	}

	/** dovrebbero esserci questi qua
		 public void Update()
		{
		 if (mCurrentState != null)
		 {
			mCurrentState.Update();
		 }
		}
		public void FixedUpdate()
		{
		 if (mCurrentState != null)
		 {
			mCurrentState.FixedUpdate();
		 }
		}
	**/
}
