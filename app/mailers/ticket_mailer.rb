class TicketMailer < ActionMailer::Base
  default :from => APP_CONFIG['from_email']
  
  def send_ticket_to_admins(ticket)
      @ticket = ticket
      mail(:to => APP_CONFIG['emails_for_new_tickets_group'], :subject => "#{APP_CONFIG['ticket_subject']}#{ticket.id} New Ticket")
    end
    
  def send_ticket_to_submitter(ticket)
      @ticket = ticket
      mail(:to => "#{ticket.submitter.email}", :subject => "#{APP_CONFIG['ticket_subject']}#{ticket.id} Successfully Submitted")
    end
    
    def send_reply_comment(comment, params={})
        @comment = comment
        @ticket = @comment.ticket
        to = ""
        if params[:send_to_submitter]
          to += @ticket.submitter.email.to_s
        end
        if params[:send_to_worker]
          to += @ticket.worker.email.to_s
        end
        mail(:to => to, :subject => "#{APP_CONFIG['ticket_subject']}#{@ticket.id} Reply from Ticket")
      end
end
