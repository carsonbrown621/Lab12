# Number Theory: Addition (LAB 12)

In this lab, you’ve learned about One Hot and Binary state machines and how to build them.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Name
Carson Brown & Patrick McClain
## Summary
- In this lab we built the same 5 state Moore machine in two ways, using one hot and binary encoding, and ran both side by side on the Basys 3. The machine outputs z = 1 when the last two inputs were the same. The one hot version used 5 flip-flops, with next state equations read directly from the state table. The binary version used 3 flip-flops, with next state logic simplified using Kmaps and the unused states as don't cares. Both versions matched on the board, which showed that different encodings can implement the same behavior.
## Lab Questions

### Compare and contrast One Hot and Binary encodings
- One hot uses one flip-flop per state (N flip-flops) and exactly one is on at a given time. Binary stores the state as a number, using ⌈log_2 N⌉ flip-flops. One hot needs more flip-flops but has simpler, faster next state logic. Binary needs fewer flip-flops but more complex logic, and it has unused codes that are invalid states. Both produce the same behavior.
### Which method did your team find easier, and why?
- One hot implementation was easier because each equation came straight from the state table by asking which states lead here, and on which input. Binary required state assignment, Kmaps, and handling don't cares, which took more time and was easier to mess up.
### In what conditions would you have to use one over the other? Think about resource utilization on the FPGA.
- One hot is usually the better choice because it uses less logic and runs faster. Vivado usually converts state machines to one hot automatically. Binary is better when flip-flops are limited or the machine has many states.
