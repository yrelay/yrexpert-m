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

;%DLEDDAT^INT^1^59547,73867^0
DLEDDAT ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
DATABS(DATABS,GRAPH,DESOP,OPER,ETU,LISRES) 
 D SAUV
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S GLDAT=$$CONCAS^%QZCHAD(TEMP,"DATES")
 
 S GLMOD=$$CONCAS^%QZCHAD(TEMP,"JALONS.MODIFIES")
 D DATA
 
 D ^%QUARBRE(GLDAT,"","","",$$^%QZCHW("Dates absolues pour l'etude")_" "_ETU,"MODATA^%DLEDDAT")
 
 D MESS
 K @(TEMP)
 D RESTOR
 Q
 
DATA 
 
 N OPA,OPD,SD,SA
 S SD=""
DEP S SD=$O(@DATABS@(SD)) I SD="" Q
 
 S OPD=@DESOP@(SD)
 
 S @GLDAT@(OPD)=$$DATEX^%QMDATE(@DATABS@(SD))
 S SA=""
ARR S SA=$O(@GRAPH@(SD,SA)) I SA="" G DEP
 
 S OPA=@DESOP@(SA)
 
 S @GLDAT@(OPD,OPA)=@GRAPH@(SD,SA)
 G ARR
 
MODATA(OPD,OPA,CONT) 
 N Y1,DAT,NA
 S DAT=$P($P(CONT,"(",2),")")
 I DAT="" D ^%VSQUEAK Q
SDA D POCLEPA^%VVIDEO
 S Y1=$$^%VZAME1($$^%QZCHW("Nouvelle date absolue")_" ["_DAT_"] ? ")
 D POCLEPA^%VVIDEO
 I Y1="" Q
 I Y1=DAT Q
 
 I $$^%QMDASAI(Y1,.Y1)=0 D ERDAT G SDA
 S Y1=$P(Y1,",")
 
 I SENS=1,(Y1>DELAILIM)!(Y1<DELAI) D ERDAT G SDA
 I SENS=-1,(Y1<DELAILIM)!(Y1>DELAI) D ERDAT G SDA
 
 S DAT=Y1,NA=@OPER@(OPA)
 S @DATABS@(NA)=DAT
 
 S REAF=1
 S CONT=$P(CONT,"(")_"("_$$DATEX^%QMDATE(DAT)_")"_$P(CONT,")",2)
 S @GLMOD@(NA,"A")=DAT
 Q
 
 
 
 
 
 
 
DATEXA(GLRES,GRAPH,DESOP,OPER,ETU,LISRES) 
 D SAUV
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S GLDAT=$$CONCAS^%QZCHAD(TEMP,"DATES")
 
 S GLMOD=$$CONCAS^%QZCHAD(TEMP,"JALONS.MODIFIES")
 D DATE
 
 D ^%QUARBRE(GLDAT,"","","",$$^%QZCHW("Dates exactes pour l'etude")_" "_ETU,"MODATE^%DLEDDAT")
 
 D MESS
 K @(TEMP)
 D RESTOR
 Q
 
DATE 
 
 N OPA,OPD,SD,SA
 S SD=""
DEPE S SD=$O(@GLRES@(SD)) I SD="" Q
 
 S OPD=@DESOP@(SD)
 
 S @GLDAT@(OPD)=$$DATEX^%QMDATE(@GLRES@(SD,2))
 S SA=""
ARRE S SA=$O(@GRAPH@(SD,SA)) I SA="" G DEPE
 
 S OPA=@DESOP@(SA)
 
 S @GLDAT@(OPD,OPA)=@GRAPH@(SD,SA)
 G ARRE
 
MODATE(OPD,OPA,CONT) 
 N Y1,DAT,NA
 S DAT=$P($P(CONT,"(",2),")")
 I DAT="" D ^%VSQUEAK Q
SDE D POCLEPA^%VVIDEO
 S Y1=$$^%VZAME1($$^%QZCHW("Nouvelle date exacte")_" ["_DAT_"] ? ")
 D POCLEPA^%VVIDEO
 I Y1="" Q
 I Y1=DAT Q
 
 I $$^%QMDASAI(Y1,.Y1)=0 D ERDAT G SDE
 S Y1=$P(Y1,",")
 
 I SENS=1,(Y1>DELAILIM)!(Y1<DELAI) D ERDAT G SDE
 I SENS=-1,(Y1<DELAILIM)!(Y1>DELAI) D ERDAT G SDE
 
 S DAT=Y1,NA=@OPER@(OPA)
 S @GLRES@(NA,2)=DAT
 
 S REAF=1
 S CONT=$P(CONT,"(")_"("_$$DATEX^%QMDATE(DAT)_")"_$P(CONT,")",2)
 S @GLMOD@(NA,"E")=DAT
 Q
 
MESS 
 N CLE,INDI,ND
 S INDI=$S($D(@LISRES):@LISRES,1:0)
 S ND=""
ME2 S ND=$O(@GLMOD@(ND)) I ND="" S @LISRES=INDI Q
 S CLE=$O(@GLMOD@(ND,""))
 S INDI=INDI+1
 S @LISRES@(INDI)="   "
 S INDI=INDI+1
 S @LISRES@(INDI)="*** "_$$^%QZCHW("pour l'operation")_" "_@DESOP@(ND)_" --> "_$$^%QZCHW("la date")_" "_$$^%QZCHW($S(CLE="E":"exacte",1:"absolue")_" devient")_" "_$$DATEX^%QMDATE(@GLMOD@(ND,CLE))
 G ME2
 
ERDAT 
 D ^%VZEAVT($$^%QZCHW("date incorrecte")) Q
 
SAUV 
 D MEM^%QCAMEM
 I '(DTM) K (QUI,WHOIS,SENS,DELAI,DELAILIM,JALON,DESOP,OPER,DATABS,GLRES,GRAPH,GRAPHINV,ETU,LISRES,MAX,POIDS,CHEM,CHEMINV) G FSAUV
 N TEMPINT
 S TEMPINT=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"KEXCLU") K @(TEMPINT)
 F I="QUI","WHOIS","SENS","JALON","DESOP","OPER","GRAPH","GRAPHINV","ETU","LISRES","DATABS","GLRES","DELAI","DELAILIM","TEMPINT","MAX","CHEM","CHEMINV","POIDS" S @TEMPINT@(I)=""
 D KEXMEM^%QCAMEM(TEMPINT)
 K @(TEMPINT)
FSAUV 
 D CURRENT^%IS,VARSYS^%QCSAP
 Q
 
RESTOR 
 D RMEM^%QCAMEM
 Q

