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

;%EDCETIQ^INT^1^59547,73868^0
EDCETIQ ;
 
 
 
 
 
ALLERA(ETI) 
 I (ETI="")!(ETI=" ") D ^%VSQUEAK W *
 I '($D(^[QUI]EDMOD(MOD,"ADR",ETI))) D ^%VSQUEAK W *
 I $D(LIGNE2) S LIGNE2=^[QUI]EDMOD(MOD,"ADR",ETI) G FIN
 S LIGNE=^[QUI]EDMOD(MOD,"ADR",ETI)
FIN Q
 
 
 
 
 
 
 
 
 
 
 
 
REPETER(ETI,COND,INIT) 
 N %U,VAR,RESULT,STOP,JPR,GLOR,ARRET S (ARRET,STOP)=0
ETIQ 
 I (ETI="")!(ETI=" ") D ^%VSQUEAK W *
 I '($D(@GLO@("ETI",ETI))) D ^%VSQUEAK W *
INIT 
 D POP
 S %U=2
INIT1 S VAR=$P(INIT,"|",%U) G COND0:VAR="" S @(VAR),%U=%U+1 G INIT1
CONDIT 
 X COND G:STOP END
COND0 S LIGNE=@GLO@("ETI",ETI)
BOUCLE 
LIG S LIGNE=$O(@GLO@("COMP",LIGNE))
 G:STOP END
 I ARRET=1 S ARRET=0 G CONDIT
 G CONDIT:LIGNE=""
 G CONDIT:@GLO@("COMP",LIGNE)=""
 X @GLO@("COMP",LIGNE)
 G BOUCLE
 
END S ARRET=0 D RPOP Q
 
POP I GLO["EDFORMAT" G POPF
 S ADRM(MODL)=ADRM(MODL)+1,ADRM(MODL,ADRM(MODL))=LIGNE Q
POPF S ADRF(FORMAT)=ADRF(FORMAT)+1,ADRF(FORMAT,ADRF(FORMAT))=LIGNE Q
 
RPOP I GLO["EDFORMAT" G RPOPF
 S LIGNE=ADRM(MODL,ADRM(MODL)) K ADRM(MODL,ADRM(MODL)) S ADRM(MODL)=ADRM(MODL)-1 Q
RPOPF S LIGNE=ADRF(FORMAT,ADRF(FORMAT)) K ADRF(FORMAT,ADRF(FORMAT)) S ADRF(FORMAT)=ADRF(FORMAT)-1 Q

