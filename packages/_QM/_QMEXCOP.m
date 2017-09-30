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

;%QMEXCOP^INT^1^59547,73878^0
%QMEXCOP ;;05:12 PM  23 Mar 1993 ; 24 Mar 93  9:12 AM
 
 
 
COPY(SOURC,DEST) 
 N REPATN,AT,%A,O,%O,LIENPF,LPREC,REPETA,REPLIEN
 N NOMFILS,COPFILS,IL,%IL,NOML1,NOML2,ORD,NOMPRED,COPLIE,A,%A
 S REPATN=$$REPRESO^%QMEXUTI
 S REPETA=$$REPETAT^%QMEXUTI
 S REPLIEN=$$LIENI^%QSGEL3
 S LIENPF="ETAT.RESEAU",LPREC="ETAT.PRECEDE"
 S RES=$$CREER^%QSGEIND(REPATN,DEST,"",1,.MSG)
 D RECOP^%QSGES25(REPATN,SOURC,DEST,"",0)
 S O="" F %O=0:0 S O=$$NXTRIAO^%QSTRUC8(REPATN,SOURC,LIENPF,O) Q:O=""  S FILS=$$VALEUR^%QSTRUC8(REPATN,SOURC,LIENPF,O) D LINVO
 Q
 
LINVO S NOMFILS=SOURC_","_FILS
 S COPFILS=DEST_","_FILS
 Q:'($$IR^%QSGE5(REPETA,NOMFILS))
 Q:'($$IR^%QSGE5(REPETA,COPFILS))
 S IL="" F %IL=0:0 S IL=$$NXTRIAO^%QSTRUC8(REPETA,NOMFILS,LPREC,IL) Q:IL=""  S ILIE=$$VALEUR^%QSTRUC8(REPETA,NOMFILS,LPREC,IL) D LIAISON
 Q
LIAISON 
 S COPLIE=DEST_","_$P(ILIE,",",2)
 Q:'($$IR^%QSGE5(REPETA,COPLIE))
 D ADDS^%QSGES26(REPETA,COPFILS,LPREC,REPETA,COPLIE)
 S NOML1=$$NOML1^%QSGES20(NOMFILS,IL,LPREC,ILIE)
 S NOML2=$$NOML1^%QSGES20(COPFILS,COPLIE,LPREC,COPLIE)
 S A="" F %A=0:0 S A=$$NXTRIA^%QSTRUC8(REPLIEN,NOML1,A) Q:A=""  I $$TYPEL^%QSGES90(A)=0 D COPATL
 Q
COPATL 
 S ORD="" F %O=0:0 S ORD=$$NXTRIAO^%QSTRUC8(REPLIEN,NOML1,A,ORD) Q:ORD=""  S NOMPRED=$$VALEUR^%QSTRUC8(REPLIEN,NOML1,A,ORD) D PA^%QSGESTI(REPLIEN,NOML2,A,NOMPRED,ORD)
 Q

