# Central Limit Theorem (CLT) Visualizer
# Purpose: Demonstrating how sample means converge into a normal distribution.

# Loading the ggplot2 and gridExtra packages:
library(ggplot2)
library(gridExtra)

# Creating a non-normal population (exponential distribution):
set.seed(42)
population <- rexp(10000, rate = 0.2)

# Defining a function to simulate sampling:
simulate_clt <- function(pop, sample_size, iterations) {
  sample_means <- replicate(iterations, mean(sample(pop, sample_size)))
  return(data.frame(Means = sample_means))
}

# Generating data for a sample size of N=2:
df_small <- simulate_clt(population, sample_size = 2, iterations = 1000)

# Generating data for a sample size of N=50:
df_large <- simulate_clt(population, sample_size = 50, iterations = 1000)

# Plotting the original population:
ggplot(data.frame(x = population), aes(x = x)) +
  geom_histogram(fill = "darkblue", alpha = 0.7, bins = 50) +
  labs(title = "Original Population", subtitle = "Highly skewed (Exponential)")+
  xlab("Value")+
  ylab("Count")

# Plotting the distribution of means for N=2:
ggplot(df_small, aes(x = Means)) +
  geom_histogram(fill = "darkblue", alpha = 0.7, bins = 50) +
  labs(title = "Sample Means (N=2)", subtitle = "Still slightly skewed") +
  xlab("Value")+
  ylab("Count")

# Plotting the distribution of means for N=50:
ggplot(df_large, aes(x = Means)) +
  geom_histogram(fill = "darkblue", alpha = 0.7, bins = 50) +
  labs(title = "Sample Means (N=50)", subtitle = "The Normal Distribution emerges!") +
  xlab("Value")+
  ylab("Count")

