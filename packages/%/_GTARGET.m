;!----------------------------------------------------------------------------!
;!                                                                            !
;! Licence et conditions d'utilisation                                        !
;! Yexpert : (your) Systeme Expert sous Mumps GT.M et GNU/Linux               !
;! Copyright (C) 2001-2015 by Hamid LOUAKED (HL).                             !
;!                                                                            !
;! Hamid LOUAKED                                                              !
;! 10, impasse Faraday                                                        !
;! 78520 LIMAY                                                                !
;! France                                                                     !
;!                                                                            !
;! yexpert@yrelay.fr                                                          !
;! http://www.yrelay.fr/                                                      !
;!                                                                            !
;! Ce programme est un logiciel libre ; vous pouvez le redistribuer           !
;! et/ou le modifier conformement aux dispositions de la Licence Publique     !
;! Generale GNU, telle que publiee par la Free Software Foundation ;          !
;! version 3 de la licence, ou encore (a votre choix) toute version ulterieure.
;!                                                                            !
;! Ce programme est distribue dans l'espoir qu'il sera utile,                 !
;! mais SANS AUCUNE GARANTIE ; sans meme la garantie implicite de             !
;! COMMERCIALISATION ou D'ADAPTATION A UN OBJET PARTICULIER.                  !
;! Pour plus de details, voir la Licence Publique Generale GNU.               !
;!                                                                            !
;! Un exemplaire de la Licence Publique Generale GNU doit etre fourni avec    !
;! ce programme ; si ce n'est pas le cas,                                     !
;! ecrivez a la Free Software Foundation Inc.,                                !
;! 675 Mass Ave, Cambridge, MA 02139, Etats-Unis.                             !
;!                                                                            !
;! Ce logiciel est telechargeable a l'adresse http://www.yrelay.fr/ ;         !
;! vous trouverez egalement, sur ce site, un mode d'emploi complet            !
;! et des informations supplementaires.                                       !
;!                                                                            !
;!----------------------------------------------------------------------------!
;!                                                                            !
;! GNU General Public License : http://www.gnu.org/copyleft/gpl.html          !
;!                                                                            !
;! Traduction francaise : http://dachary.org/loic/gpl-french.pdf              !
;!                                                                            !
;!----------------------------------------------------------------------------!

;!============================================================================!
;! Nomprog     :                                                              !
;! Module      :                                                              !
;! But         :                                                              !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%GTARGET^INT^1^58140,5726^0
%GTARGET ;GET TARGET DIR,SYS FOR IMPLICIT GLOBAL ;JO1052 6/29/98  ; Compiled March 6, 2000 19:35:26
 ;GIVEN:  %GLO = global name
 ;         ^UTILITY("GLO",--) list.
 ;
 ;RETURNS: %GLO("IMPDIR") = target directory
 ;         %GLO("IMPSYS") = target directory set
 ;         %GLO("IMPFULL") = format: |"^^DUA0:[QA.MVX]"| - for display
 ;         %GLO("REPL",0)= # of targets for replication (0 if none)
 ;         %GLO("REPL",i,"DIR") = target directory for replication # i
 ;         %GLO("REPL",i,"SYS") = target system for replication # i
 ;         %GLO("REPL",i,"FULL") = full ref |^SYS^DIR| for replic'n # i
 ;         %GLO("JOURNAL") = 1 if journal enabled, =0 if not.
 ;
 ;RETURNS %GLO("IMPDIR")="",%GLO("IMPSYS")="",%GLO("IMPFULL")=""
 ;   if %GLO is not implicit.
 ;RETURNS %GLO("REPL",0)=0 if %GLO not replicated.
 ;
 ;Optional entry point 'INT' given %DIRNAM and %GLO,
 ;  to look-up in other source directory. 
 ;
 ;Optional entry point 'REF' given %GLO,
 ;  to return %GLO("IMPFULL") and %GLO("REPL",i,"FULL")
 ;  with surrounding quotes (") so can do indirect reference.
1 N %DIRNAM,%QUOTES S %DIRNAM="",%QUOTES="" D GO G K
INT N %QUOTES S %QUOTES="" D GO G K
REF N %DIRNAM,%QUOTES S %DIRNAM="",%QUOTES="""" D GO G K
K Q
GO N ENTRY,GINDEX,I,IMPTAB,MGDIR,PNTR,Q,QUOTE,REP1,REPCOUNT,REPINDEX,REPSTUF,%ST D ^%ST
 S QUOTE=%QUOTES
 NEW MGRNS
 S MGRNS="^^"_$ZU(12)
 I '$D(^|%DIRNAM|UTILITY("GLO",%GLO)) G PUNT
 S ENTRY=^|%DIRNAM|UTILITY("GLO",%GLO),PNTR=$P(ENTRY,"^",4)
 I PNTR\256'=65535 S %GLO("IMPDIR")="",%GLO("IMPSYS")="",%GLO("IMPFULL")="" G SKIP1 ;NOT IMPLICIT
 S GINDEX=PNTR#256
 I $D(^|MGRNS|SYS("GIND",GINDEX))
BADGIND E  U 0 W !,"**ERROR: GLOBAL POINTS TO UNDEFINED IMPLICIT-TABLE INDEX#**" X CRASH ;- GLOBAL POINTS TO UNDEFINED IMPLICIT-TABLE INDEX# - WILL GIVE <PROTECT> ERROR WHEN THIS GLOBAL IS REFERENCED
 S IMPTAB=^|MGRNS|SYS("GIND",GINDEX)
 S %GLO("IMPSYS")=$P(IMPTAB,"^",2),%GLO("IMPDIR")=$P(IMPTAB,"^",3,999)
 S %GLO("IMPFULL")="|"_QUOTE_"^"_%GLO("IMPSYS")_"^"_%GLO("IMPDIR")_QUOTE_"|" G SKIP1
SKIP1 ;Get here after implicit info set.  Now replication and journal.
 S Q=$P(ENTRY,"^",1)
 S REPINDEX=Q\16#16 K %GLO("REPL") S %GLO("REPL",0)=0 I REPINDEX>0 D REPL
 S %GLO("JOURNAL")=Q\4#2 ; =1 if journalled, =0 if not
DONE Q
PUNT F I="IMPDIR","IMPSYS","IMPFULL","JOURNAL" S %GLO(I)=""
 K %GLO("REPL") S %GLO("REPL",0)=0
 Q
REPL I $D(^|MGRNS|SYS("REPL",REPINDEX))
BADREPL E  U 0 W !,"**ERROR: GLOBAL POINTS TO UNDEFINED REPLICATION-TABLE INDEX#**" X CRASH ;- GLOBAL POINTS TO UNDEFINED REPLICATION INDEX# - WILL CRASH WHEN THIS GLOBAL IS SET/KILLED.
 S REP1=""
 F REP1=1:1:$S($D(^|MGRNS|SYS("REPL",REPINDEX,0)):^(0),1:0) D REPL2
 Q
REPL2 S REPSTUF=^|MGRNS|SYS("REPL",REPINDEX,REP1)
 S REPCOUNT=%GLO("REPL",0)+1
 S %GLO("REPL",REPCOUNT,"DIR")=$P(REPSTUF,"^",3,999)
 S %GLO("REPL",REPCOUNT,"SYS")=$P(REPSTUF,"^",2)
 S %GLO("REPL",REPCOUNT,"FULL")="|"_QUOTE_"^"_%GLO("REPL",REPCOUNT,"SYS")_"^"_%GLO("REPL",REPCOUNT,"DIR")_QUOTE_"|"
 S %GLO("REPL",0)=REPCOUNT
 Q

