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

;%MZMAJ3^INT^1^59547,73872^0
MOZMAJ3 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 S NLIS="",NPHS=""
 I $$^%QCAZG("%RENUM")=1 K SOPS
LOP S NLIS=$O(@TB2@(NLIS)) G:NLIS="" FIN S LC=@TB2@(NLIS),TYPS=$P(LC,"^",1)+0,LC=$P(LC,"^",2,999) S:TYPS>3 TYPS=3 G @TYPS
0 G 3
1 K VAL,ATT2
 D C(1) S SOPS=5E-1,IDC="",NPHS=ATT2("NUMERO.OPERATION",1) G LOP
2 G 3:NPHS="" D C(2) G 3:'($D(ATT2("ACTION"))),3:ATT2("ACTION",1)="",3:ATT2("NUMERO.OPERATION",1)=""
 S SOPS=$S($D(SOPS(NPHS)):SOPS(NPHS)+1,1:1),SOPS(NPHS)=SOPS
 S OPS=NPHS_"."_$TR($J("",3-$L(SOPS))," ",0)_SOPS,IDC=ATT2("ACTION",1)_"/"_OPS
 S ^OPVUU($J,OPS)=IDC,^OPVUU($J)=GAM,SAVIDC=IDC
 D MSG^%VZEATT("Suppression de l'operation "_SAVIDC)
 
 D SX^%QSGESTK($$OI^%MZQS,GAM_","_IDC)
 
 D PS^%QSGESTI($$GI^%MZQS,GAM,$$LIEN^%MZQS,IDC,OPS)
 S SOPS(NPHS)=SOPS(NPHS)+1 G LOP
3 
31 G LOP
C(I) 
 
 
 S %U="" F %V=1:1 S %U=$O(MOZ(I,%U)) Q:%U=""  S ATT2=$P(MOZ(I,%U),"^",1),VAL=$P(LC,$C(1),%V),NOR=$P(MOZ(I,%U),"^",2) S:NOR="" NOR=1 S ATT2(ATT2,NOR)=$$GETLBLAN^%VTLBLAN(VAL)
 
FIN Q
ATTS(TB2,ATT2) 
 S NOPX300=""
 F %U=0:0 S NOPX300=$O(^OPVUU($J,NOPX300)) Q:NOPX300=""  I $D(@TB2@(^OPVUU($J,NOPX300))) S IDFX300=^OPVUU($J,NOPX300),%NTT="" D MAJI
 K %NTT,NOPX300,IDFX300
 Q
 
MAJLI S %NTT=$O(@TB2@(IDFX300,%NTT))
 Q:%NTT=""
 D STOCK^%QSGESTI($$OI^%MZQS,^OPVUU($J)_","_IDFX300,ATT2,@TB2@(IDFX300,%NTT),%NTT)
 G MAJLI
 
RECUP(NLIS) 
 
 
 G:NLIS="" FIN G:'($D(@TB2@(NLIS))) RECUP1
 S LCS=@TB2@(NLIS),TYPS=$P(LCS,"^",1)+0,LCS=$P(LCS,"^",2,999) G:TYPS'=2 FIN
RECUP1 S NLIS=$ZP(@TB2@(NLIS)) G:(NLIS=0)!(NLIS="") FIN
BOUCL S LCS=@TB2@(NLIS),TYPS=$P(LCS,"^",1)+0,LCS=$P(LCS,"^",2,999) G:TYPS'=1 RECUP1
 K ^MOZTABUU($J,NLIS) G FIN
 
MAJ 
 Q:$$^%QCAZG("SAVIDC")=""
 G:$D(^MOZMOUV($J,SAVIDC))'>1 SUITMAJ
MAJ2 D MSG^%VZEATT("Mise a jour de "_SAVIDC) S ATT=""
MAJ21 S ATT=$O(^MOZMOUV($J,SAVIDC,ATT))
 G:ATT="" SUITMAJ
 S NORS=""
MAJ22 S NORS=$O(^MOZMOUV($J,SAVIDC,ATT,NORS))
 G:NORS="" MAJ21
 S VALEUR=ATT(ATT,NORS),OLDVAL=ATT2(ATT,NORS)
 I ((ATT["MACHINE")!(ATT="POSTE.MAIN"))!(ATT="OUTIL") S VALEUR=$$M^%QAX(VALEUR),OLDVAL=$$M^%QAX(OLDVAL)
 I VALEUR'="" D STOCK^%QSGESTI($$OI^%MZQS,GAM_","_SAVIDC,ATT,VALEUR,NORS) G MAJ22
 I OLDVAL'="" D PS^%QSGESTI($$OI^%MZQS,GAM_","_SAVIDC,ATT,OLDVAL,NORS)
 G MAJ22
SUITMAJ G:$D(^MOZCOM($J,SAVIDC))'>1 MAJ32
 
MAJ3 D MSG^%VZEATT("Mise a jour des commentaires de "_SAVIDC) S ATT=""
MAJ31 S ATT=$O(^MOZCOM($J,SAVIDC,"COMMENTAIRE",ATT))
 G:ATT="" KILLU
 S NORS=^MOZCOM($J,SAVIDC,"COMMENTAIRE",ATT) D PA^%QSGESTI($$OI^%MZQS,GAM_","_SAVIDC,"COMMENTAIRE",NORS,ATT) G MAJ31
 
MAJ32 D LIEN^%MZMAJ4(NLI2)
 
KILLU S %U="" F %V=1:1 S %U=$O(^MOZTABU($J,%U)) Q:%U=""  K @TB@(%U),^MOZTABU($J,%U)
 S %U="" F %V=1:1 S %U=$O(^MOZTABUU($J,%U)) Q:%U=""  K @TB2@(%U),^MOZTABUU($J,%U)
 S (FINCOM,ENCOURS,NEWOP)=0,SAVIDC=""
 Q

