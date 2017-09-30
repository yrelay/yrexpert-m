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

;%DLGAMME^INT^1^59547,73868^0
DLGAMME ;
 
 
 
 
 
 
 
 
 
 
JALT(MAP,REPART,LANC,COMPOSANT,PERE,QUANT,SENS,CAPLIM,REPMAC,ATMAC,ATDFAB,DELAI,DELAILIM,MODEX,FAMTEC,DECAL,COCONT,MAXITER,ERR,OPRES,LISRES) 
 N TMP,TOP,TIN,T,MAXDEL,GAM,ART,REPLAN,REPGAM,REPMACH,MES,LMES,TININV,NTRAIT,ORIG,DEST,TOT,REGIMAC,MOR,IBNI
 S TOT=1
 S TMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TMP)
 S DESOP=$$CONCAS^%QZCHAD(TMP,"OP")
 S REGIMAC=$$CONCAS^%QZCHAD(TMP,"REG.CAL")
 S REPLAN=$$LAN^%DLCON2
 S REPGAM=$$GAMME^%DLCON2
 S REPMACH=$$MACH^%DLCON2
 S ART=$P(COMPOSANT,",",1,^[QUI]RQSNCLES(REPART)),GAM=$P(COMPOSANT,",",^[QUI]RQSNCLES(REPGAM))
 I VISU S MES=LANC_" : "_$$^%QZCHW("jalonnement pour l'article")_" "_ART D MSG^%VZEATT(MES) S LMES=$L(MES)+2
 I GAM="" S ERR=2 G FCOM
 K @(REGIMAC)
 D LIRE^%DLLIRE(COMPOSANT,"","",QUANT,ATMAC,ATDFAB,REGIMAC,DESOP,.ERR,LISRES)
 I ERR'=0 G FCOM
 G:'($D(@DESOP@(1))) FCOM
 S IBNI=""
 G COMM2
 
 
COMMUN(LANC,DESOP,DELAI,DELAILIM,REGIMAC,OPRES,LISRES) 
 N TOT
 S TOT=0
 
COMM2 N GRAPH,GRINV,JALON,GLOPER,SAUCH,LONGCHEM,FEUILLES,RACINES,DATFIX
 S MOR="  "
 S JALON=$$CONCAS^%QZCHAD(TMP,"JALON")
 S GRAPH=$$CONCAS^%QZCHAD(TMP,"GRAPH")
 S GRINV=$$CONCAS^%QZCHAD(TMP,"GRA.INV")
 S DATFIX=$$CONCAS^%QZCHAD(TMP,"DATE.FIXE")
 
 I MODEX=1 S SAUCH=$$CONCAS^%QZCHAD(TMP,"SAUV.CHARG") K @(SAUCH) D SAUVCH^%DLCPART(LANC,IBNI,SAUCH)
 I MAP S GLOPER=$$CONCAS^%QZCHAD(TMP,"DESOP.INV") D CONSOP
 
 I VISU S MES=LANC_" : "_$$^%QZCHW("Calcul des jalons pour l'article")_" "_ART D MSG^%VZEATT(MES) S LMES=$L(MES)+2
 G:$$ARRET STO
 D DATFIXE^%DLLIRE(REPLAN,LANC,DATFIX)
 D GET^%DLGETJA(REPART,LANC,ART,GAM,DESOP,JALON)
 
 D:MAP JALON^%DLEDRES(JALON,DESOP,GLOPER,ETU,LISRES),AFFETU^%DLEVAL
 G:$$ARRET STO
 
 I VISU S MES=LANC_" : "_$$^%QZCHW("Graphe des operations pour")_" "_ART D MSG^%VZEATT(MES) S LMES=$L(MES)+2
 D CONST^%DLGRAPH(JALON,GRAPH,GRINV)
 
 S POIDS=$$CONCAS^%QZCHAD(TMP,"POIDS.OP")
 S CHEMINV=$$CONCAS^%QZCHAD(TMP,"CHEM.INV")
 S LONGCHEM=$$CONCAS^%QZCHAD(TMP,"LONG.CHEM")
 G:'($$LONG^%DLCHEM(DESOP,GRAPH,GRINV,POIDS,CHEMINV,LONGCHEM,.MAX)) STO
 G:$$ARRET STO
 
 D:MAP GRAPH^%DLEDRES(GRAPH,GRINV,JALON,DESOP,GLOPER,ETU,POIDS,CHEMINV,LONGCHEM,.MAX,LISRES)
 D:MAP GRAPH^%DLMAP($$RGAMME^%DLCON2,COMPOSANT,DESOP,GRAPH,LISRES),AFFETU^%DLEVAL
 G:$$ARRET STO
 
 S FEUILLES=$$CONCAS^%QZCHAD(TMP,"FEUILLES")
 S RACINES=$$CONCAS^%QZCHAD(TMP,"RACINES")
 D EXTREMITE^%DLGRAPH(DESOP,GRAPH,GRINV,FEUILLES,RACINES)
 
 S DATABS=$$CONCAS^%QZCHAD(TMP,"DAT.ABS")
 I VISU S MES=LANC_" : "_$$^%QZCHW("Calcul des dates absolues pour")_" "_ART D MSG^%VZEATT(MES) S LMES=$L(MES)+2
 G:'($$CALCU^%DLCDAT(SENS,DELAI,DELAILIM,POIDS,CHEMINV,GRAPH,GRINV,FEUILLES,RACINES,DESOP,REGIMAC,DATABS,LISRES)) STO
 
 D:MAP DATABS^%DLEDDAT(DATABS,GRAPH,DESOP,GLOPER,ETU,LISRES),AFFETU^%DLEVAL
 G:$$ARRET STO
 
 
 S MOR=$$^%QZCHW("Positionnement sans decalage")
 I VISU S MES=LANC_" : "_$$^%QZCHW("Positionnement ss decalage pour")_" "_ART D MSG^%VZEATT(MES) S LMES=$L(MES)+2
 G:$$POSER^%DLEXACT(MAP,SENS,DELAILIM,DESOP,DATABS,DATFIX,OPRES,LISRES) STO
 
 
 G:DECAL=0 STO
 G:$$ARRET STO
 G:DECAL>2 ITER
 
 S MOR=$$^%QZCHW("Decalage avec contraction")
 I VISU S MES=LANC_" : "_$$^%QZCHW("Decalage avec contraction pour")_" "_ART D MSG^%VZEATT(MES) S LMES=$L(MES)+2
 S ERRNONBL=0
 G:$$POSER^%DLGCONT(COCONT,MAX,SENS,GRAPH,GRINV,FEUILLES,RACINES,CHEMINV,DESOP,DATABS,REGIMAC,DATFIX,DELAI,DELAILIM,OPRES,LISRES) STO
 G:DECAL=1 STO
 G:$$ARRET STO
ITER 
 S MOR=$$^%QZCHW("Decalage avec iteration")
 I VISU S MES=LANC_" : "_$$^%QZCHW("Decalage avec iteration pour")_" "_ART D MSG^%VZEATT(MES) S LMES=$L(MES)+2
 S ERRNONBL=0
 G:'($$POSER^%DLGITER(MAXITER,SENS,GRAPH,GRINV,FEUILLES,RACINES,CHEMINV,DESOP,DATABS,REGIMAC,DATFIX,DELAI,DELAILIM,OPRES,LISRES)) STO
 
STO D STOCK^%DLRESU(MOR,ART,OPRES,LISRES)
 D PREC^%DLRESU(CHEMINV,OPRES)
FCOM 
 I MODEX=1 D RETSOU^%DLCAP2,RESTCH^%DLCPART(SAUCH)
 Q:'(TOT)
 K @(TMP) Q
 
VIS Q:$D(VISU)  S VISU=0 Q
 
CONSOP 
 
 N NUM,%N
 S NUM=""
 F %N=0:0 S NUM=$O(@DESOP@(NUM)) Q:NUM=""  S @GLOPER@(@DESOP@(NUM))=NUM
 Q
 
ARRET() 
 N ST
 R *ST:0 D TOUCHE^%INCCLAV(ST,.ST)
 I ST'=1 Q 0
 D POCLEPA^%VVIDEO
 S ST=$$MES^%VZEOUI($$^%QZCHW("Confirmez-vous l'abandon")_" ? ","O")
 D POCLEPA^%VVIDEO
 Q:ST'=1 0
 S ERR=34
 D RETRAIT^%DLCAP2(OPRES)
 Q 1

