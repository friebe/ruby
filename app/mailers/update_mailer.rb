class UpdateMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def create_welcome(param_days)
    projects = Project.joins(:comments).where("comments.created_at > ?", param_days.days.ago).uniq
    @projects_with_comments = projects.map do |project|
      [project, project.comments.where("comments.created_at > ?", param_days.days.ago)]
    end

    mail(to: 'test@test.de', subject: 'Updates')
  end
end
