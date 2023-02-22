using Dates
using LibGit2

function submit_commit()
    repo_path = "/path/to/your/repo" # Replace with your own repo path
    repo = Repo(repo_path)
    index = GitIndex(repo)

    # Make changes to your code here

    commit_msg = "Daily commit - $(today())"
    signature = Signature("Your Name", "your.email@example.com")
    Git.commit(repo, index, commit_msg, signature)
end

function main()
    while true
        current_time = Dates.now()
        target_time = Dates.DateTime(Dates.today(), Dates.Time(18, 0, 0)) # Replace with your desired commit time

        if current_time >= target_time
            submit_commit()
            sleep(86400) # Wait 24 hours before submitting the next commit
        else
            sleep(60) # Check again in 1 minute
        end
    end
end

main()
