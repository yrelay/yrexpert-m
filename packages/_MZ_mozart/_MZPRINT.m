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

;%MZPRINT^INT^1^59547,73872^0
MOZPRINT ;
 
 
 
 
 N NUGAP,BASEL,BASEP,INDIVIDU,LSTAR,LOSTAR,ZLI,PAGE,NULI,CD,CF,LGAF,NBPAG,ZLI,LILIM,IMPR,VAL,GSM,BASE,OK
 S BASE=CXT("@","BASE") I '($D(^MOZIDF($I,WHOIS))) D INIT(BASE,.OK) Q:'(OK)
 S INDIVIDU=CXT("@","OBJET") I '($$IR^%QSGEST5($$GI^%MZQS,INDIVIDU)) G FIN
 D GRENS
 S LILIM=$S($D(^IMPRCOUR(WHOIS)):^IMPRCOUR(WHOIS)-15,1:50),IMPR=$S($D(^TABIDENT(WHOIS,"PRINTER")):^TABIDENT(WHOIS,"PRINTER"),1:0) S:IMPR=0 LILIM=15
 D ^%MZLSTAR,CHA I $D(^POSENR($J)) D I
FIN K ^POSENR($J),^U($J) Q
GRENS F %ZZZ="INDICE.PIECE","DESIGNATION.PIECE","NUMERO.PLAN","DATE.RECUPERATION.TOTEM","INDICE.PLAN","NUMERO.TOTEM" S VAL=$$^%QSCALVA($$GI^%MZQS,INDIVIDU,%ZZZ),TBV(%ZZZ)=VAL
 S BASEL=$$GI^%MZQS
 S BASEP="" F %B=1:1 S BASEP=$O(^[QUI]RQSLIEN(BASEL,BASEP)) Q:BASEP=""  Q:$P(^[QUI]RQSLIEN(BASEL,BASEP),"^",1)=1
 S BASEP=$S(BASEP'="":$P(^[QUI]RQSLIEN(BASEL,BASEP),"^",2),1:BASEL)
 I TBV("NUMERO.PLAN")="" S NUGAP=$P(INDIVIDU,",",1) Q:NUGAP=""  F %ZZZ="NUMERO.PLAN","INDICE.PLAN" S VAL=$$^%QSCALVA(BASEP,NUGAP,%ZZZ),TBV(%ZZZ)=VAL
 I TBV("INDICE.PIECE")="" S NUGAP=$P(INDIVIDU,",",1) Q:NUGAP=""  S %ZZZ="INDICE.PIECE",VAL=$$^%QSCALVA(BASEP,NUGAP,%ZZZ),TBV(%ZZZ)=VAL
 I TBV("DESIGNATION.PIECE")="" S NUGAP=$P(INDIVIDU,",",1) Q:NUGAP=""  S %ZZZ="DESIGNATION.PIECE",VAL=$$^%QSCALVA(BASEP,NUGAP,%ZZZ),TBV(%ZZZ)=VAL
 Q
I D ZD^%QMDATE4,^%QMDAK0 O IMPR U IMPR
 F PAGE=1:1 Q:'($D(^POSENR($J,PAGE)))  D ENTET,AFFREN,AFF
 W ! C IMPR Q
ENTET H 5 W #,!,"Le : ",%DAT," a : ",HEURE,?30,"*** GAMME DE FABRICATION ***",!,!
 Q
AFFREN S GSM="Page : "_PAGE_"/"_NBPAG W LSTAR,!,"| No de piece  : ",$P(INDIVIDU,",",1),?40,"No de plan",?52,": ",$E(TBV("NUMERO.PLAN"),1,24),?79,"|",!,"| Ind. piece   : ",$E(TBV("INDICE.PIECE"),1,20),?40,"Ind. plan",?52,": ",$E(TBV("INDICE.PLAN"),1,24)
 W ?79,"|",!,"| Date Totem   : ",$E(TBV("DATE.RECUPERATION.TOTEM"),1,20),?40,"No ET.TOTEM",?52,": ",$E(TBV("NUMERO.TOTEM"),1,24),?79,"|",!,"| Designation  : ",$E(TBV("DESIGNATION.PIECE"),1,60),?79,"|",!,"|",?40-($L(GSM)\2),GSM,?79,"|",!,LSTAR,!
 Q
CHA K ^POSENR($J) S ^MOZTRAIT($J)=1 D ^%MZS02(INDIVIDU) S ZLI=100,PAGE=0,NULI=0 F %ZLG=1:1 S NULI=$N(^U($J,0,NULI)) Q:NULI=-1  S LGAF=$P(^U($J,0,NULI),"^",2) D AFFI
 S NBPAG=$S($D(^POSENR($J,PAGE)):PAGE,1:PAGE-1)
 K ^MOZTRAIT($J)
 Q
AFFI S CD=1,CF=79
 S LGAF=$TR(LGAF,$C(1)," ")
TL S DC=$E(LGAF,CF) I (DC'=" ")&(DC'="") S CF=CF-1 G TL
 S ZLI=ZLI+1 I ZLI>LILIM S ZLI=1,PAGE=PAGE+1
 S ^POSENR($J,PAGE,ZLI)=$E(LGAF,CD,CF) Q:DC=""  S CD=CF+1,CF=CF+80 G TL
AFF F %ZLG=1:1 Q:'($D(^POSENR($J,PAGE,%ZLG)))  W !,^POSENR($J,PAGE,%ZLG)
 Q
INIT(NG,OK) 
 S OK=1,NG=$$NOMLOG^%QSF(NG)
 I '($D(^TABIDENT(WHOIS,"MOZART",NG))) D ^%VZEAVT("Le repertoire "_NG_" n'est pas connecte a MOZART, edition impossible !!") S OK=0 Q
 D GET^%MZREP Q

