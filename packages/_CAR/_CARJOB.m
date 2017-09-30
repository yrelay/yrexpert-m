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

;%CARJOB^INT^1^59547,73867^0
%CARJOB ;
 
 
 N ACTI,TABLE,TYPACTI,TRT,LIST,CARACTI
 N GLOPAR,GLOECH,RESACT,QUI,WHOIS,BATCHC,GLOETA
 N NUMECH,ECH,DATE
 
 
 
 
 
 S GLOECH="^CARGECH",GLOETA="^CARGETA",GLOPAR=$$CONCAS^%QZCHAD("^CARGBA","PARAM")
 
 
 S ACTI=@GLOPAR@("ACTI"),NUMECH=@GLOPAR@("NUMECH"),DATE=@GLOPAR@("DATE")
 
 
 K @GLOETA@("ATTENTE",NUMECH) S @GLOETA@("LANCE",NUMECH)=ACTI
 
 S @GLOECH@("ECH",NUMECH,"NUMJOB")=$J,@GLOECH@("ECH",NUMECH,"DATDEB")=DATE
 
 S $ZT="PB^%CARJOB"
 
 D NETJOB^%SGNETMZ($J)
 
 S WHOIS=@GLOECH@("ACT",ACTI,"WHOIS"),TRT=@GLOECH@("ACT",ACTI,"TRT"),LIST=@GLOECH@("ACT",ACTI,"LISTE"),QUI=^TABIDENT(WHOIS,"MACHINE")
 S (IO,IOP)=0 D CURRENT^%SYSCARU,VARSYS^%QCSAP,ZD^%QMDATE4,STAND^%VTOZE
 D INIT^%SGVAR
 
 D SET^%SGVAR("ECR",0),SET^%SGVAR("CLAV",0)
 D INITREM^%QZCHW,INIT^%SYSSEMA(QUI)
 S WHOIS("ETUDE")=0
 
 I '($D(^[QUI]TTL(TRT))) S TEXTE=$$^%QZCHW("TRAITEMENT INCONNU") G ERREUR
 I '($$EX^%QSGEST7(LIST)) S TEXTE=$$^%QZCHW("LISTE INCONNUE") G ERREUR
 S BATCHC=1
 S RESACT=$$ACTIVL^%TLIACTI(TRT,LIST,0,0)
 
 K @GLOETA@("LANCE",NUMECH) S @GLOETA@("FINI",NUMECH)=""
 G FIN
 
ERREUR 
 K @GLOETA@("LANCE",NUMECH) S @GLOETA@("INTERROMPU",NUMECH)=""
 S @GLOECH@("ECH",NUMECH,"TEXT")=$$^%QZCHW("PB DKBMS : ")_TEXTE
 G FIN
 
 
PB 
 S $ZT=""
 K @GLOETA@("LANCE",NUMECH) S @GLOETA@("INTERROMPU",NUMECH)=""
 S @GLOECH@("ECH",NUMECH,"TEXT")=$$^%QZCHW("PB MUMPS : ")_$ZE
 G FIN
 
FIN 
 S @GLOECH@("ECH",NUMECH,"DATFIN")=$$HEURE
 D KILL^%SGVAR
 Q
 
HEURE() 
 N HEURE,JOUR,TIME
 S HEURE=$P($H,",",2),JOUR=$P($H,",",1)
 S TIME=$$DATE3^%QMDATE_$$HEURE^%QMDATE
 S TIME=$P(TIME,"H")_$P(TIME,"H",2)
 Q TIME
 ;

