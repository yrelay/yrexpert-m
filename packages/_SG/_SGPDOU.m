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

;%SGPDOU^INT^1^59547,73890^0
%SGPDOU ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
ARCHIDON(LISTE,LISTEATT,MODEARCH,FICHIER,COMM) 
 N SEP,FILE,MARQUE,TABREP,LEX,TABLIEN,REPLIEN,BASE,ADR,I,%I,IND,IFIL
 N ATT,TYPATT,TABLISTE,REPDEST,VAL,ORD,NOMIND2,PRECIFIL,PRECFILE
 
 S FILE=$$TEMP^%SGUTIL
 S MARQUE=$$TEMP^%SGUTIL
 S TABREP=$$TEMP^%SGUTIL
 S LEX=$$TEMP^%SGUTIL
 S TABLIEN=$$TEMP^%SGUTIL
 S TABLISTE=$$TEMP^%SGUTIL
 S @FILE=0
 
 S REPLIEN=$$LIENI^%QSGEL3
 
 S SEP="^"
 
 D CREERLI^%SGPDOU2("L0","ARL")
 
 G:LISTE'="*" ARCHLST
 
 S MODEARCH=4,LISTEATT="*",IFIL="",REP=""
ARCHALL S REP=$$NXTR^%QSTRUC8(REP) G:REP="" ECRITURE
 G:$$REPSYS(REP)!($$NOMLOG^%QSF(REP)="") ARCHALL
 S IND="",PRECFILE=@FILE
 F %I=0:0 S IND=$$NXTRI^%QSTRUC8(REP,IND) Q:IND=""  I '($D(@MARQUE@(REP,IND))) S @FILE=@FILE+1,@FILE@(@FILE,"BASE")=REP,@FILE@(@FILE,"IND")=IND,@MARQUE@(REP,IND)=""
 
 I ('($D(@TABLISTE@(REP))))&(PRECFILE<@FILE) D CREERLI^%SGPDOU2(REP,"ARC")
NXOBJALL 
 S PRECIFIL=IFIL
 S IFIL=$O(@FILE@(IFIL)) I IFIL="" S IFIL=PRECIFIL G ARCHALL
 G ARCHREP
 
 
 
 
ARCHLST S BASE=$$BASE^%QSGEST7(LISTE)
 
 D CREERLI^%SGPDOU2(BASE,"ARC")
 
 S ADR=$$ADRLT^%QSGEST7(LISTE) G:ADR="" NONTRIE
 
 S I="" F %I=0:0 S I=$O(@ADR@(I)) Q:I=""  S IND=@ADR@(I),@FILE=@FILE+1,@FILE@(@FILE,"BASE")=BASE,@FILE@(@FILE,"IND")=IND,@MARQUE@(BASE,IND)=""
 G FINTRI
NONTRIE 
 S ADR=$$ADRLIS^%QSGEST7(LISTE) G:LISTE="" ECHEC
 S IND="" F %I=0:0 S IND=$O(@ADR@(IND)) Q:IND=""  S @FILE=@FILE+1,@FILE@(@FILE,"BASE")=BASE,@FILE@(@FILE,"IND")=IND,@MARQUE@(BASE,IND)=""
FINTRI 
 
 I MODEARCH=1 G ECRITURE
 S IFIL=""
 
 
 
 
NXOBJ S IFIL=$O(@FILE@(IFIL)) G:IFIL="" ECRITURE
 
ARCHREP S BASE=@FILE@(IFIL,"BASE"),IND=@FILE@(IFIL,"IND")
 
 D AJOUTLI^%SGPDOU2(BASE,IND)
 
 S ATT=""
NXATT S ATT=$$NXTRIA^%QSTRUC8(BASE,IND,ATT) G:ATT'="" NXATT2
 G:LISTE'="*" NXOBJ
 G NXOBJALL
NXATT2 G:LISTEATT="*" LECTYPAT
 I '($$EXA^%QMLILA(LISTEATT,ATT)) G NXATT
LECTYPAT 
 S TYPATT=$$TYPE2^%QSGEST9(BASE,ATT)
 
 
 
 I (TYPATT<1)!(TYPATT>5) G NXATT
 
 
 
 
 S REPDEST=$$REPD^%QSGEL2(BASE,ATT)
 G:REPDEST=REPLIEN NXATT
 S ORD=""
NXORD S ORD=$$NXTRIAO^%QSTRUC8(BASE,IND,ATT,ORD) G:ORD="" NXATT
 S VAL=$$VALEUR^%QSTRUC8(BASE,IND,ATT,ORD)
 
 S NOMIND2=$S(TYPATT=2:IND_","_VAL,1:VAL)
 
 
 S @TABLIEN@(BASE,IND,ATT,ORD)=REPDEST_SEP_NOMIND2
 I '($D(@LEX@(ATT))) S @LEX@(ATT)=""
 G:MODEARCH'=4 NXORD
 
 I '($D(@TABLISTE@(REPDEST))) D CREERLI^%SGPDOU2(REPDEST,"ARC")
 D AJOUTLI^%SGPDOU2(REPDEST,NOMIND2)
 I $D(@MARQUE@(REPDEST,NOMIND2)) G NXORD
 
 
 
 S @MARQUE@(REPDEST,NOMIND2)=""
 S @FILE=@FILE+1,@FILE@(@FILE,"BASE")=REPDEST,@FILE@(@FILE,"IND")=NOMIND2
 G NXORD
 
 
 
 
ECRITURE 
 N RESULTAT
 D ECRITURE^%SGPDOU2
 S RESULTAT=@TABLISTE@("L0")
 K @(FILE),@(TABLISTE),@(MARQUE),@(TABREP),@(LEX),@(TABLIEN)
 Q RESULTAT
 
ECHEC K @(FILE),@(TABLISTE),@(MARQUE),@(TABREP),@(LEX),@(TABLIEN)
 Q 0
 
REPSYS(R) 
 Q ((((((R="L0")!(R="TRAITEMENT"))!(R=REPLIEN))!(R="RQS"))!(R="ATTRIBUT"))!(R="%"))!(R="NOEUD.I")
 ;
 ;

