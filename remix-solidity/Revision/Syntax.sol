pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract TodoList {
    
    //state varibales
    // task - [
     //   deadline, 
     //   time created, 
     //   task name,
    // task id 
    struct Task {
        string  taskName;
        uint256 taskId;
        uint256 taskDeadline;
        uint256 taskCreatedOn;
        bool    isCompleted;
    }
    mapping(uint256 => Task) public tasks;
    uint256 public taskCounter;
    
    //Logic
    // memory vs storage
    // add functionality
    function addTask(
        string memory _taskName,
        uint32 dueAfterDays
        ) public returns(bool) {
        taskCounter++;
        uint256 deadline = block.timestamp +  (dueAfterDays*( 1 days));
        Task memory task;
        task.taskName = _taskName;
        task.taskId = taskCounter;
        task.taskCreatedOn = block.timestamp;
        task.taskDeadline = deadline;
        
        tasks[taskCounter] = task;
        return true;
    }
    
    // delete functionality, 
    function deleteTask(
        uint _taskId
        ) public returns(bool) {
            delete tasks[_taskId];
            return true;
        }
        
    // update functionality
    function updateTaskName(uint256 _taskId, string memory _newTaskName) public returns(bool){
        tasks[_taskId].taskName = _newTaskName;
        return true;
    }
    
    function updateTaskDeadline(uint256 _taskId, uint256 _newDeadlineDays) public returns(bool){
        Task memory task = tasks[_taskId];
        uint256 newDeadline = task.taskCreatedOn + (_newDeadlineDays*(1 days));
        task.taskDeadline = newDeadline;
        tasks[_taskId] = task;
        return true;
    }
    
}