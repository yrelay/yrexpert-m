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

;%CARJOBE^INT^1^59547,73867^0
%CARJOBE ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
COHER 
 N NUMECH,%N,GLOECH,GLOETA
 
 S GLOECH="^CARGECH",GLOETA="^CARGETA"
 S NUMECH="" F %N=0:0 S NUMECH=$O(@GLOETA@("LANCE",NUMECH)) Q:NUMECH=""  S NUMJOB=@GLOECH@("ECH",NUMECH,"NUMJOB") I '($$EXISTE^%SYSCARU(NUMJOB)) D STOP
 Q
 
STOP K @GLOETA@("LANCE",NUMECH)
 I ('($D(@GLOETA@("INTERROMPU",NUMECH))))&('($D(@GLOETA@("FINI",NUMECH)))) S @GLOETA@("INTERROMPU",NUMECH)=""
 Q
 
 
 
STOPSCH 
 N NJOB,RESKILL,GLOBAT
 S GLOBAT="^CARGBA"
 Q:'($D(@GLOBAT@("JOBSCHED")))
 S NJOB=@GLOBAT@("JOBSCHED")
 S RESKILL=$$STOP^%SYSCARU(NJOB)
 Q
 
 
 
STOPSUP 
 N NJOB,RESKILL,GLOBAT
 S GLOBAT="^CARGBA"
 Q:'($D(@GLOBAT@("JOBSCHED")))
 S NJOB=@GLOBAT@("JOBSUPER")
 S RESKILL=$$STOP^%SYSCARU(NJOB)
 Q
 
 
 
STOPALL 
 N GLOETA,%E,NUMECH
 S GLOJOB="^CARGJOB",GLOETA="^CARGETA"
 Q:'($D(@GLOETA@("LANCE")))
 S NUMECH="" F %E=0:0 S NUMECH=$O(@GLOETA@("LANCE",NUMECH)) Q:NUMECH=""  D STOPJOB(NUMECH)
 Q
 
 
 
STOPJOB(NUMECH) 
 N GLOECH,GLOETA,RESKILL,NUMJOB
 S GLOECH="^CARGECH",GLOETA="^CARGETA"
 I $D(@GLOETA@("LANCE",NUMECH)) K @GLOETA@("LANCE",NUMECH) S @GLOETA@("INTERROMPU",NUMECH)="",@GLOECH@("ECH",NUMECH,"TEXTE")="intervention exterieure"
 S NUMJOB=@GLOECH@("ECH",NUMECH,"NUMJOB"),RESKILL=$$STOP^%SYSCARU(NUMJOB)
 Q

