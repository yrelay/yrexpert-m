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

;%QWETUD2^INT^1^59547,73886^0
%QWETUD2 ;
 
 
 
 
 
 
 
 
 
 
UC(YY1,REAF) 
 S REAF=0
 I YY1="" Q 1
 I YY1="?" S REAF=1 Q $$HELP(.YY1)
 I '($D(^[QUI]RQSGLO("QW","ETUDE",YY1))) D ^%VZEAVT($$^%QZCHW("Etude inconnue")) Q 0
 Q 1
 
 
SUP(ETU) 
 D MSG^%VZEATT($$^%QZCHW("Suppression en cours"))
 K ^[QUI]RQSGLO("QW","ETUDE",ETU),^[QUI]RQSGLO("QW","BUT",ETU),^[QUI]RQSGLO("QW","CONTR",ETU),^[QUI]RQSGLO("QW","SITDEP",ETU)
 K ^[QUI]RQSDON("QW","BUT",ETU),^[QUI]RQSDON("QW","CONTR",ETU)
 
 I $$OKR^%INCOIN("QS")=1 D SX^%QSGESTK($$REP,ETU)
 Q:'($D(^[QUI]RQSGLO("QW","ET",ETU)))
 N INDI
 
 S INDI=^[QUI]RQSGLO("QW","ET",ETU)
 S GLOSAVE=$$CONCAS^%QZCHAD("^[QUI]RQSDON(""QW"",""SVG"")",INDI)
 K ^[QUI]RQSGLO("QW","ET",ETU),@(GLOSAVE)
 Q
 
COPIE(ETU,DUP) 
 N ADR
 
 S ADR="^[QUI]RQSGLO(""QW"",""BUT"")"
 D GLOCOP^%QCAGLC($$CONCAS^%QZCHAD(ADR,ETU),$$CONCAS^%QZCHAD(ADR,DUP))
 
 S ADR="^[QUI]RQSGLO(""QW"",""CONTR"")"
 D GLOCOP^%QCAGLC($$CONCAS^%QZCHAD(ADR,ETU),$$CONCAS^%QZCHAD(ADR,DUP))
 
 S ADR="^[QUI]RQSGLO(""QW"",""SITDEP"")"
 D GLOCOP^%QCAGLC($$CONCAS^%QZCHAD(ADR,ETU),$$CONCAS^%QZCHAD(ADR,DUP))
 S ADR="^[QUI]RQSGLO(""QW"",""ET"")"
 D GLOCOP^%QCAGLC($$CONCAT^%QZCHAD(ADR,""""_ETU_""",""I"""),$$CONCAT^%QZCHAD(ADR,""""_DUP_""",""I"""))
 D GLOCOP^%QCAGLC($$CONCAT^%QZCHAD(ADR,""""_ETU_""",""L"""),$$CONCAT^%QZCHAD(ADR,""""_DUP_""",""L"""))
 
 S ADR="^[QUI]RQSDON(""QW"",""BUT"")"
 D GLOCOP^%QCAGLC($$CONCAS^%QZCHAD(ADR,ETU),$$CONCAS^%QZCHAD(ADR,DUP))
 
 S ADR="^[QUI]RQSDON(""QW"",""CONTR"")"
 D GLOCOP^%QCAGLC($$CONCAS^%QZCHAD(ADR,ETU),$$CONCAS^%QZCHAD(ADR,DUP))
 Q
 
CREER(NOM,COMM,TYP,INDI,REP,DOM) 
 S ^[QUI]RQSGLO("QW","ET",NOM,"ETAT")="NON.ACTIVEE"
 I $$OKR^%INCOIN("QS")'=1 Q
 N ETU
 S ETU=$$REP
 D PA("NOM",NOM)
 D PA("TYPE.ETUDE","MENTAILLE")
 D PA("COMMENTAIRE",COMM)
 D PA("OBJET.ETUDIE",TYP)
 D PA("INDIVIDU",INDI)
 D PA("REPERTOIRE",REP)
 D PA("DOMAINE",DOM)
 D PA("DATE.CREATION",$$TEMPS^%QMDATE)
 D OFF^%VZEATT
 Q
PA(ATR,VAL) 
 I VAL="" D PSV^%QSGESTI(ETU,NOM,ATR)
 D PA^%QSGESTI(ETU,NOM,ATR,VAL,1)
 Q
 
 
LOAD(NOM,RESUL) 
 N CONT
 S RESUL(1)="QW",RESUL(2)="ETUDE",RESUL(3)=NOM
 S CONT=^[QUI]RQSGLO("QW","ETUDE",NOM)
 S RESUL(4)=$P(CONT,"^",1),RESUL(5)=$P(CONT,"^",2)
 S RESUL(6)=$P(CONT,"^",3),RESUL(7)=$P(CONT,"^",4)
 S RESUL(8)=$P(CONT,"^",5)
 Q
 
LOADA(NOM,NF,RESUL) 
 N CONT,I
 S RESUL(1)="QW",RESUL(2)="BUT",RESUL(3)=NOM,RESUL(4)=NF
 I $D(^[QUI]RQSGLO("QW","BUT",NOM,NF)) S CONT=^[QUI]RQSGLO("QW","BUT",NOM,NF),RESUL(5)=$P(CONT,"^",1),RESUL(6)=$P(CONT,"^",2) Q
 F I=4:1:6 S RESUL(I)=""
 Q
 
LOADC(NOM,NF,RESUL) 
 N CONT,I
 S RESUL(1)="QW",RESUL(2)="CONTR",RESUL(3)=NOM,RESUL(4)=NF
 I '($D(^[QUI]RQSGLO("QW","CONTR",NOM,NF))) G INCO
 S CONT=^[QUI]RQSGLO("QW","CONTR",NOM,NF)
 S RESUL(5)=$P(CONT,"^",1),RESUL(6)=$P(CONT,"^",2),RESUL(7)=$P(CONT,"^",3)
 S RESUL(8)=$P(CONT,"^",4),RESUL(9)=$P(CONT,"^",5),RESUL(10)=$P(CONT,"^",6)
 S RESUL(11)=$P(CONT,"^",7),RESUL(12)=$P(CONT,"^",8),RESUL(13)=$P(CONT,"^",9)
 Q
INCO F I=4:1:13 S RESUL(I)=""
 Q
 
AFF(ETU) 
 
 N NF,SCR
 S SCR="QWETUDE"
 D LOAD(ETU,.RESUL)
 D ^%VAFIGRI,^%VAFISCR
 D ^%VSAVMUL(SCR)
 S SCR="QWETATR",NF=$O(^[QUI]RQSGLO("QW","BUT",ETU,"")) S:NF="" NF=1
 D LOADA(ETU,NF,.RESUL)
 D ^%VAFIGRI,^%VAFISCR
 S SCR="QWETCTR",NF=$O(^[QUI]RQSGLO("QW","CONTR",ETU,"")) S:NF="" NF=1
 D LOADC(ETU,NF,.RESUL)
 D ^%VAFIGRI,^%VAFISCR
 S SCR="QWETUDE"
 D ^%VRESMUL(SCR)
 Q
 
 
HELP(YY1) 
 N %I,CONT,DOM,ETAT,ETU,GL,LETU,TYP,VAL
 D ^%VZEATT
 S LETU=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"HELP") K @(LETU)
 S GL="^[QUI]RQSGLO(""QW"",""ETUDE"")",ETU=""
 F %I=0:0 S ETU=$O(@GL@(ETU)) Q:(ETU="")!(ETU="z")  S CONT=@GL@(ETU),TYP=$P(CONT,"^",2),DOM=$P(CONT,"^",5) D INS
 I '($D(@LETU)) D ^%VZEAVT($$^%QZCHW("Aucune etude")) S YY1="" Q 0
 D INIT^%QUCHOIP(LETU,1,"",0,3,78,20),POCLEPA^%VVIDEO
 
 D ^%VZCDB($$^%QZCHW("Choisissez une etude MENTAILLE"),0)
 S DX=0,DY=2 X XY D REV^%VVIDEO X XY W $J("",5),$$^%QZCHW("Etude"),$J("",5),$$^%QZCHW("Objet.etudie"),$J("",10),$$^%QZCHW("Domaine"),$J("",23),$$^%QZCHW("Etat"),$J("",7) X XY D NORM^%VVIDEO
 D AFF^%QUCHOIP
 
 S ETU=$$UN^%QUCHOIP
 S YY1=$P(ETU," ",1)
 D END^%QUCHOIP
 K @(LETU)
 I YY1="" Q 0
 Q 1
INS S ETAT=$S($D(^[QUI]RQSGLO("QW","ET",ETU,"ETAT")):^[QUI]RQSGLO("QW","ET",ETU,"ETAT"),1:"NON.ACTIVEE")
 S VAL=ETU_" "_TYP_$J("",20-$L(TYP))_$E(DOM,1,30)_$J("",31-$L(DOM))_ETAT
 S @LETU@(VAL)=""
 Q
 
REP() 
 Q "ETUDE.I"

