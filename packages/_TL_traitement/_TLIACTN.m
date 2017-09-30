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

;%TLIACTN^INT^1^59547,74029^0
%TLIACTN ;
 
 
 
 
 
MOZ 
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Activation MOZART"))
 I '($$OKR^%INCOIN("MOZ")) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Action inaccessible")) S ECHEC=1 Q
 N RE,OBB,PGM,NG,PERE
 S RE=$$RED(ACTI,1)
 I RE=0 S RE=CXT("@","BASE"),OBB=CXT("@","OBJET") G ACTMOZ
 S RE=$$SUBST^%ANARBR2(RE,.CXT,"ATT^%TLIACT3",.POS)
 I (POS=0)!(RE="") D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Imposs. evaluer repertoire")) S ECHEC=1 Q
 S RE=$$NOMINT^%QSF(RE)
 I RE="" D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Repertoire inconnu")) S ECHEC=1 Q
 S OBB=$$SUBST^%ANARBR2($$RED(ACTI,2),.CXT,"ATT^%TLIACT3",.POS)
 I (POS=0)!(OBB="") D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Imposs. evaluer objet")) S ECHEC=1 Q
 I $$RANG^%QSGES17(RE)'=$L(OBB,",") D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Nom objet incorrect")) S ECHEC=1 Q
 I '($D(^TABIDENT(WHOIS,"MOZART",$$NOMLOG^%QSF(RE),"GE"))) D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("repertoire non connecte a MOZART ")) S ECHEC=1 Q
 I '($$IR^%QSGEST5(RE,OBB)),'($$CREOP) S ECHEC=1 Q
ACTMOZ 
 
 
 I '($D(^TABIDENT(WHOIS,"MOZART",$$NOMLOG^%QSF(RE),"GE"))) D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("repertoire non connecte a MOZART ")) S ECHEC=1 Q
 I '($$IR^%QSGEST5(RE,OBB)),'($$CREOP) S ECHEC=1 Q
 I $$GI^%MZQS'=RE S NG=$$NOMLOG^%QSF(RE) D GET^%MZREP
 D MEM^%QCAMEM K (WHOIS,QUI,OBB)
 S PGM=OBB,HOST=$$TABID^%INCOIN("ORDINATEUR")
 D CURRENT^%IS,VARSYS^%QCSAP
 X ^MOZ100
 D RMEM^%QCAMEM
 
 D REAFF^%TLUTIL
 Q
 
CREOP() 
 N REP,MSG,RANG D POCLEPA^%VVIDEO S REP=$$MES^%VZEOUI($$^%QZCHW("Gamme inexistante, voulez-vous la creer ?"),"N")
 I REP'=1 Q 0
 
 S MSG=""
 S REP=$$CREPER^%QSGEIND(RE,OBB,"",.MSG)
 I REP'=0 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW(MSG)) S ECHEC=1 Q 0
 Q 1
 
 
DEJAL N REP,ETUD,MSG
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Dejalonnement d'une etude"))
 
 S REP=$$REP^%DLETUDE
 S ETUD=$$SUBST^%ANARBR2($$RED(ACTI,1),.CXT,"ATT^%TLIACT3",.POS)
 I (POS=0)!(ETUD="") D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Imposs. evaluer nom etude")) S ECHEC=1 Q
 I '($$IR^%QSGEST5(REP,ETUD)) S MSG=ETU_" "_$$^%QZCHW("est une etude inconnue") G ERR
 D RETCHARG^%DLETUD2(MODEX,0,REP,ETUD,MSG)
 G:MSG'="" ERR
 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Fin du dejalonnement"))
 Q
 
ERR D:MODAF ADD^%TLIFEN("LOG","  "_MSG)
 S ECHEC=1
 Q
 
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

