class Task < ApplicationRecord
    enum :status, [:S, :A, :B, :C, :D, :F, :Z]
end