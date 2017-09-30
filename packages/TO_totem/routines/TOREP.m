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

;TOREP^INT^1^59547,74875^0
REP ;
 
 
 
 
 
RETERR S $ZT=^TOZE($I,"A") Q:%ABEND=1
 N REPER,ATTRI,INDIV,OUT,TYPE,RESUL,CHOIX,CONDI,CDTI
 S %RESULTAT="",(INDIV,CONDI)=""
 S @("REPER="_$P(EXPFONC,"/",2)),@("ATTRI="_$P(EXPFONC,"/",3)),INDIV=^V($I,YA,"INDIVIDU.ETUDIE")
 S:$P(EXPFONC,"/",4)'="" @("CONDI="_$P(EXPFONC,"/",4))
 G:INDIV="" FIN
 I REPER="SUIVI.DES.LANCEMENTS" D AFF G FIN
 I REPER="PIECE.PRIMAIRE" S INDIV=$$^%QSCALVA("SUIVI.DES.LANCEMENTS",INDIV,"PIECE.PRIMAIRE") D AFF G FIN
 I REPER="OUTILLAGE" S INDIV=$$^%QSCALVA("SUIVI.DES.LANCEMENTS",INDIV,"PIECE.PRIMAIRE") D MVI^%QSCALVA("PIECE.PRIMAIRE",INDIV,REPER,.OUT,.TYPE) F I=1:1:OUT S INDIV=$O(OUT(INDIV)) Q:INDIV=""  D AFF
 I REPER="OUTILLAGE" G FIN
 S MES=REPER_": repertoire non pris en compte par TOTEM",%RESULTAT="Repertoire inconnu",DX=0,DY=23 X XY D POCLEPA^%VVIDEO W $E(MES,1,78) H 2 Q
 
 
 
 
AFF D CDT Q:CDTI
 S RESUL=$$^%QSCALVA(REPER,INDIV,ATTRI)
 S CHOIX=$$PARA^%QZNBN1(RESUL)&((RESUL>%RESULTAT)!('($$PARA^%QZNBN1(%RESULTAT))))
 S %RESULTAT=$S('($$PARA^%QZNBN1(RESUL)):%RESULTAT_RESUL_"*",CHOIX:RESUL,1:%RESULTAT)
 I %RESULTAT="*" S MES="L'attribut "_ATTRI_" n'existe pas pour "_INDIV_" dans "_REPER,DX=0,DY=23 X XY D POCLEPA^%VVIDEO W $E(MES,1,78) H 2 S %RESULTAT="Non trouve"
 Q
CDT I CONDI="" S CDTI=0 Q
 S CDTI=1 Q
FIN I %RESULTAT="" S %RESULTAT="???" Q

